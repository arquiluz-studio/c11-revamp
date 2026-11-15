import createIntlMiddleware from 'next-intl/middleware'
import { NextResponse, type NextRequest } from 'next/server'
import {
  COUNTRY_OVERRIDE_COOKIE,
  COUNTRY_PREF_COOKIE,
  GEO_COOKIE,
  HEADQUARTERS,
  countryFromHost,
  countryOrigin,
  defaultCountry,
  isCountryCode,
  isGatewayHost,
  isProductionDomain,
  stripPort,
  type CountryCode,
} from '@/config/countries'
import { routing } from '@/i18n/routing'
import { withRefreshedSession } from '@/lib/supabase/proxy'

const handleI18nRouting = createIntlMiddleware(routing)

const ONE_YEAR = 60 * 60 * 24 * 365

function requestHost(request: NextRequest): string {
  return request.headers.get('x-forwarded-host') ?? request.headers.get('host') ?? ''
}

function detectedGeo(request: NextRequest, allowQuery: boolean): string | null {
  const fromQuery = allowQuery ? request.nextUrl.searchParams.get('geo') : null
  const value = fromQuery ?? request.headers.get('x-vercel-ip-country')
  return value ? value.toLowerCase() : null
}

function gatewayCountry(geo: string | null): CountryCode {
  return geo === 'cr' || geo === 'pa' ? geo : HEADQUARTERS
}

/** Sends the bare `.com` (and local `localhost`) to the country site, keeping the path. */
function redirectFromGateway(request: NextRequest, host: string): NextResponse {
  const local = stripPort(host) === 'localhost'
  const country = gatewayCountry(detectedGeo(request, local))
  const url = request.nextUrl.clone()
  url.searchParams.delete('geo')
  if (local) {
    const port = host.split(':')[1]
    url.host = `${country}.localhost${port ? `:${port}` : ''}`
    return NextResponse.redirect(url, 302)
  }
  const target = new URL(`${url.pathname}${url.search}`, countryOrigin(country))
  return NextResponse.redirect(target, 302)
}

function resolveCountry(request: NextRequest, host: string): { country: CountryCode; fromQuery: boolean } {
  const fromHost = countryFromHost(host)
  if (fromHost) return { country: fromHost, fromQuery: false }
  const query = request.nextUrl.searchParams.get('country')
  if (isCountryCode(query)) return { country: query, fromQuery: true }
  const cookie = request.cookies.get(COUNTRY_OVERRIDE_COOKIE)?.value
  if (isCountryCode(cookie)) return { country: cookie, fromQuery: false }
  return { country: defaultCountry(), fromQuery: false }
}

const isAdminPath = (pathname: string) => pathname === '/admin' || pathname.startsWith('/admin/')

function handleAdmin(request: NextRequest): Promise<NextResponse> | NextResponse {
  const { pathname } = request.nextUrl
  if (pathname === '/robots.txt') {
    return new NextResponse('User-agent: *\nDisallow: /\n', { headers: { 'content-type': 'text/plain' } })
  }
  if (isAdminPath(pathname)) return withRefreshedSession(request, () => NextResponse.next({ request }))
  const url = request.nextUrl.clone()
  url.pathname = `/admin${pathname === '/' ? '' : pathname}`
  return withRefreshedSession(request, () => NextResponse.rewrite(url, { request }))
}

export function proxy(request: NextRequest) {
  const host = requestHost(request)
  const { pathname, searchParams } = request.nextUrl
  const adminHost = process.env.ADMIN_HOST

  if (adminHost && stripPort(host) === stripPort(adminHost)) return handleAdmin(request)

  const onProductionDomain = isProductionDomain(host)
  if (isAdminPath(pathname)) {
    // The admin is only reachable through ADMIN_HOST in production; previews and localhost can use /admin directly.
    if (onProductionDomain) return NextResponse.rewrite(new URL('/__not-found', request.url))
    return withRefreshedSession(request, () => NextResponse.next({ request }))
  }

  if (isGatewayHost(host)) return redirectFromGateway(request, host)

  const { country, fromQuery } = resolveCountry(request, host)
  const geo = detectedGeo(request, !onProductionDomain)
  const fromSelector = searchParams.get('ref') === 'selector'

  let response: NextResponse
  if (pathname === '/sitemap.xml' || pathname === '/robots.txt') {
    const file = pathname === '/sitemap.xml' ? 'sitemap' : 'robots'
    response = NextResponse.rewrite(new URL(`/${country}/seo/${file}`, request.url))
  } else {
    response = handleI18nRouting(request)
    const isRedirect = response.status >= 300 && response.status < 400
    if (!isRedirect) {
      const rewrite = response.headers.get('x-middleware-rewrite')
      const target = new URL(rewrite ?? request.url)
      target.pathname = `/${country}${target.pathname}`
      response.headers.set('x-middleware-rewrite', target.toString())
      response.headers.set('x-middleware-request-x-iho-geo', geo ?? '')
      response.headers.set('x-middleware-request-x-iho-country', country)
      const overridden = response.headers.get('x-middleware-override-headers')
      response.headers.set(
        'x-middleware-override-headers',
        [overridden, 'x-iho-geo', 'x-iho-country'].filter(Boolean).join(','),
      )
    }
  }

  if (fromSelector) {
    response.cookies.set(COUNTRY_PREF_COOKIE, country, { path: '/', maxAge: ONE_YEAR, sameSite: 'lax' })
  }
  if (fromQuery) {
    response.cookies.set(COUNTRY_OVERRIDE_COOKIE, country, { path: '/', maxAge: 60 * 60 * 24, sameSite: 'lax' })
  }
  const geoValue = geo ?? ''
  if (request.cookies.get(GEO_COOKIE)?.value !== geoValue) {
    response.cookies.set(GEO_COOKIE, geoValue, { path: '/', maxAge: 60 * 60 * 24, sameSite: 'lax' })
  }
  return response
}

export const config = {
  matcher: ['/((?!api|_next|_vercel|.*\\..*).*)', '/sitemap.xml', '/robots.txt'],
}
