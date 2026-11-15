import { useTranslations } from 'next-intl'
import type { NavLink } from '@/lib/types/site'

type Social = { platform: string; url: string; label: string }

export function Footer({ homeHref, contactHref, privacyHref = '#', socials = [], countries = [] }: {
  homeHref: string
  contactHref: string
  privacyHref?: string
  socials?: Social[]
  countries?: { href: string; label: string; current: boolean }[]
}) {
  const t = useTranslations('footer')
  const links: NavLink[] = [
    { href: privacyHref, label: t('privacy') },
    { href: contactHref, label: t('contact') },
  ]
  return (
    <footer style={{ background: '#000000', color: '#bcc4c3' }}>
      <div style={{ maxWidth: 1240, margin: '0 auto', padding: '30px 40px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: 16 }}>
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start', gap: 14 }}>
          <a href={homeHref}>
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/images/logo-c11-a-white.svg" alt="Ciento Once" style={{ height: 52, width: 'auto', display: 'block' }} />
          </a>
          {countries.length > 0 && (
            <nav aria-label={t('countries')} style={{ display: 'flex', gap: 20, flexWrap: 'wrap', fontFamily: '"General Sans", "Helvetica Neue", Arial, sans-serif', fontSize: 13 }}>
              {countries.map(country => (
                <a key={country.href} href={country.href} aria-current={country.current ? 'page' : undefined} style={{ color: country.current ? '#fffef7' : '#bcc4c3' }}>
                  {country.label}
                </a>
              ))}
            </nav>
          )}
        </div>
        <div style={{ fontFamily: '"General Sans", "Helvetica Neue", Arial, sans-serif', fontSize: 13, color: '#818f8f' }}>{t('rights', { year: new Date().getFullYear() })}</div>
        <div style={{ display: 'flex', gap: 28, alignItems: 'center', flexWrap: 'wrap', fontFamily: '"General Sans", "Helvetica Neue", Arial, sans-serif', fontSize: 13 }}>
          {socials.map(s => (
            <a key={s.url} href={s.url} target="_blank" rel="noopener noreferrer" style={{ color: '#bcc4c3' }}>{s.label}</a>
          ))}
          {links.map(l => <a key={l.label} href={l.href} style={{ color: '#bcc4c3' }}>{l.label}</a>)}
        </div>
      </div>
    </footer>
  )
}
