import type { Metadata } from 'next'
import { DISPLAY, SANS } from '@/components/ui/tokens'
import './globals.css'

export const metadata: Metadata = {
  title: '404 — Ciento Once',
}

export default function GlobalNotFound() {
  return (
    <html lang="es">
      <body>
        <main style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: 24, background: '#f3f1e9', color: '#292b2b', fontFamily: SANS, textAlign: 'center', padding: 40 }}>
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img src="/images/logo-c11-black.svg" alt="Ciento Once" style={{ height: 28, width: 'auto' }} />
          <h1 style={{ fontFamily: DISPLAY, fontSize: 54, margin: 0, textTransform: 'uppercase' }}>404</h1>
          <p style={{ margin: 0 }}>No encontramos esta página. · We couldn’t find this page.</p>
          <a href="/" className="iho-btn" style={{ background: '#292b2b', color: '#fff', padding: '10px 22px', borderRadius: 2, fontWeight: 600, textDecoration: 'none' }}>
            Volver al inicio · Back home
          </a>
        </main>
      </body>
    </html>
  )
}
