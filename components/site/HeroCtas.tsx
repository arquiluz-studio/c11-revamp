import { ButtonArrow } from '@/components/ui/Arrow'
import type { HeroCtaVM } from '@/lib/types/site'

const STYLES: Record<HeroCtaVM['style'], { background: string; color: string; border: string }> = {
  red: { background: '#292b2b', color: '#fff', border: '1.5px solid transparent' },
  outline: { background: 'transparent', color: '#fff', border: '1.5px solid #fff' },
  black: { background: '#000000', color: '#fff', border: '1.5px solid transparent' },
}

export function HeroCtas({ actions, marginTop = 0 }: { actions: HeroCtaVM[]; marginTop?: number }) {
  if (actions.length === 0) return null
  return (
    <div style={{ display: 'flex', flexWrap: 'wrap', gap: 12, marginTop, pointerEvents: 'auto' }}>
      {actions.map((action, index) => (
        <a
          key={`${action.href}-${index}`}
          href={action.href}
          className="iho-btn"
          target={action.newWindow ? '_blank' : undefined}
          rel={action.newWindow ? 'noopener noreferrer' : undefined}
          style={{
            display: 'inline-flex',
            alignItems: 'center',
            gap: 10,
            padding: '14px 26px',
            borderRadius: 2,
            fontFamily: '"General Sans", "Helvetica Neue", Arial, sans-serif',
            fontWeight: 600,
            fontSize: 15,
            textDecoration: 'none',
            boxSizing: 'border-box',
            ...STYLES[action.style],
          }}
        >
          {action.label}
          <ButtonArrow />
        </a>
      ))}
    </div>
  )
}
