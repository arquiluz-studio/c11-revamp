import type { Metadata } from 'next'
import { ContentHero } from '@/components/site/pages/ContentHero'
import { PageShell } from '@/components/site/pages/PageParts'
import { ProjectBrowser, type BrowserProject } from '@/components/site/ProjectBrowser'
import { innerChrome } from '@/components/site/SiteChrome'
import { COUNTRIES, COUNTRY_CODES, sortByCountry } from '@/config/countries'
import { heroDocumentTitle, resolvePageHero } from '@/lib/content/page-hero'
import { sitePaths } from '@/lib/content/paths'
import { toProjectCardVM } from '@/lib/content/site'
import { t } from '@/lib/i18n-fields'
import { getProjects } from '@/lib/queries/projects'
import { getBusinessLines } from '@/lib/queries/site'
import { buildAlternates } from '@/lib/seo'
import { resolveSiteParams, type SiteParams } from '@/lib/site-params'

export async function generateMetadata({ params }: { params: Promise<SiteParams> }): Promise<Metadata> {
  const { country, locale } = await resolveSiteParams(params)
  const hero = await resolvePageHero(country, 'projects', locale)
  return { title: heroDocumentTitle(hero.title), alternates: buildAlternates({ href: '/projects', country, locale }) }
}

export default async function ProjectsPage({ params }: { params: Promise<SiteParams> }) {
  const { country, locale } = await resolveSiteParams(params)
  const paths = sitePaths(locale)
  const [grouped, lines, chrome] = await Promise.all([
    Promise.all(COUNTRY_CODES.map(async code => ({ code, rows: await getProjects(code) }))),
    getBusinessLines(),
    innerChrome(country, locale, paths),
  ])

  const projects: BrowserProject[] = grouped.flatMap(({ code, rows }) =>
    rows.map(project => {
      const card = toProjectCardVM(project, locale, paths)
      return {
        ...card,
        meta: COUNTRIES[code].name[locale],
        country: code,
        solutionIds: project.business_lines.flatMap(link => (link.business_line ? [link.business_line.id] : [])),
      }
    }),
  )
  const countries = sortByCountry(COUNTRY_CODES, code => code).map(code => ({ id: code, label: COUNTRIES[code].name[locale] }))
  const solutions = lines.map(line => ({ id: line.id, label: t(line, 'name', locale) }))
  const hero = await resolvePageHero(country, 'projects', locale, projects.find(project => project.country === country)?.image ?? projects[0]?.image)

  return (
    <PageShell chrome={chrome} hero={hero.enabled}>
      <ContentHero hero={hero} />
      <ProjectBrowser
        projects={projects}
        countries={countries}
        solutions={solutions}
      />
    </PageShell>
  )
}
