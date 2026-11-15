import { useTranslations } from 'next-intl'
import { MediaImage } from '@/components/ui/MediaImage'
import type { ProductCardVM } from '@/lib/types/site'

type Props = { product: ProductCardVM; showCategory?: boolean; ariaHidden?: boolean }

export function ProductCard({ product, showCategory = false, ariaHidden }: Props) {
  const t = useTranslations('pages.products')
  const category = showCategory ? product.category : undefined
  const eyebrow = product.brand || category
  return (
    <a
      href={product.href}
      aria-hidden={ariaHidden || undefined}
      tabIndex={ariaHidden ? -1 : undefined}
      className="iho-prod-card"
      style={{ display: 'block', textDecoration: 'none', color: 'inherit' }}
    >
      <div className="iho-prod-mark">
        <MediaImage
          image={product.image}
          alt={ariaHidden ? '' : product.name}
          sizes="(max-width: 599px) 50vw, (max-width: 899px) 33vw, 300px"
          className="iho-prod-img"
        />
        {product.hover && (
          <MediaImage image={product.hover} alt="" sizes="(max-width: 599px) 50vw, (max-width: 899px) 33vw, 300px" className="iho-shot__hover" />
        )}
      </div>
      {eyebrow && (
        <div style={{ marginTop: 14 }}>
          {product.brand && (
            <div style={{ fontFamily: '"Archivo Narrow", "Arial Narrow", sans-serif', fontSize: 10, letterSpacing: '1.2px', color: '#818f8f', textTransform: 'uppercase' }}>
              {product.brand}
            </div>
          )}
          {category && (
            <div style={{ fontFamily: '"Archivo Narrow", "Arial Narrow", sans-serif', fontSize: 10, letterSpacing: '1.2px', color: '#818f8f', marginTop: product.brand ? 4 : 0 }}>
              {category}
            </div>
          )}
        </div>
      )}
      <div style={{ fontFamily: '"General Sans", "Helvetica Neue", Arial, sans-serif', fontSize: 16, color: '#000000', marginTop: eyebrow ? 5 : 16 }}>
        {product.name}
      </div>
      {(product.price || product.inquiry) && (
        <div style={{ fontFamily: '"Archivo Narrow", "Arial Narrow", sans-serif', fontSize: 12, letterSpacing: '0.5px', color: '#000000', marginTop: 6, display: 'flex', gap: 10, alignItems: 'baseline' }}>
          {product.price && <span>{product.price}</span>}
          {!product.price && product.inquiry && <span style={{ color: '#818f8f', textTransform: 'uppercase' }}>{t('quote')} →</span>}
        </div>
      )}
    </a>
  )
}
