import { Fragment } from 'react'
import { DISPLAY, MONO } from './tokens'

export function SectionLabel({ children, style }: { children: React.ReactNode; style?: React.CSSProperties }) {
  return <div style={{ fontFamily: MONO, fontSize: 12, fontWeight: 700, letterSpacing: '1.5px', textTransform: 'uppercase', color: '#818f8f', marginBottom: 18, ...style }}>{children}</div>
}

/** Small centered title used by Projects and Team. */
export function SectionTitle({ children, style }: { children: React.ReactNode; style?: React.CSSProperties }) {
  return <h2 style={{ fontFamily: DISPLAY, fontWeight: 700, fontSize: 50, lineHeight: 0.98, letterSpacing: '-0.5px', textTransform: 'uppercase', margin: '0 0 18px', ...style }}>{children}</h2>
}

/** Large left-aligned title used by most home sections. */
export function DisplayTitle({ children, style }: { children: React.ReactNode; style?: React.CSSProperties }) {
  return <h2 style={{ fontFamily: DISPLAY, fontWeight: 700, fontSize: 54, lineHeight: 0.96, letterSpacing: '-0.5px', textTransform: 'uppercase', margin: 0, ...style }}>{children}</h2>
}

/**
 * Renders translated/DB text where `\n` is a line break and `*text*` is highlighted in the brand slate.
 */
export function RichText({ text, highlightColor = '#818f8f' }: { text: string; highlightColor?: string }) {
  const lines = text.split('\n')
  return (
    <>
      {lines.map((line, i) => (
        <Fragment key={i}>
          {i > 0 && <br />}
          {line.split(/(\*[^*]+\*)/g).filter(Boolean).map((part, j) =>
            part.startsWith('*') && part.endsWith('*')
              ? <span key={j} style={{ color: highlightColor }}>{part.slice(1, -1)}</span>
              : <Fragment key={j}>{part}</Fragment>,
          )}
        </Fragment>
      ))}
    </>
  )
}
