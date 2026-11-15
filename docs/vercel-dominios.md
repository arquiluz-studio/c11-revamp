# Dominios en Vercel

El sitio decide el país por el dominio. En Vercel va un solo proyecto, y los dominios apuntan a ese mismo deployment. El código en `config/countries.ts` hace el resto.

| País | Dominio canónico | Código |
|---|---|---|
| Entrada (elige país por IP) | `www.cientoonce.com` | — |
| México (sede) | `www.cientoonce.com.mx` | `mx` |
| Costa Rica | `www.cientoonce.cr` | `cr` |
| Panamá | `www.cientoonce.com.pa` | `pa` |

La URL pública no lleva el país en la ruta. `https://www.cientoonce.com.pa/proyectos` es Panamá; `https://www.cientoonce.com.mx/en/projects` es México en inglés. El segmento `[country]` es un rewrite interno. El apex de cada país (`cientoonce.com.pa`, `cientoonce.cr`, …) no sirve el sitio: redirige a su `www`.

`www.cientoonce.com` tampoco sirve una sede. Responde 302 según `x-vercel-ip-country`: Costa Rica va a `www.cientoonce.cr`, Panamá a `www.cientoonce.com.pa`, y cualquier otra IP (México incluida) a `www.cientoonce.com.mx`. Conserva la ruta.

## 1. Un proyecto, los dominios

En el proyecto de Vercel: **Settings → Domains → Add**. Agrega cada dominio en su forma apex y en `www`:

- `cientoonce.com` y `www.cientoonce.com`
- `cientoonce.com.mx` y `www.cientoonce.com.mx`
- `cientoonce.cr` y `www.cientoonce.cr`
- `cientoonce.com.pa` y `www.cientoonce.com.pa`
- `admin.cientoonce.com.mx` (el admin; ver más abajo)

En cada país, deja **`www` conectado a Production** y configura **Redirect** permanente (308) del apex hacia ese `www`. El origen canónico del código es con `www` (`https://www.cientoonce.com.mx`, etc.). Si el apex también sirve el sitio, o si el código manda a la gente al apex mientras Vercel manda el apex de vuelta a `www`, el navegador entra en un loop (`ERR_TOO_MANY_REDIRECTS`).

`cientoonce.com` y `www.cientoonce.com` los dos van a Production, sin redirect de Vercel entre ellos. La app redirige al país. Si Vercel redirige el apex a `www` antes de llegar a la app, también funciona: el `www` hace el mismo salto.

Todos deben quedar en **Production**, en el mismo proyecto. Vercel emite el certificado cuando el DNS ya resuelve.

Si Vercel pide verificar el dominio porque está en otra cuenta, agrega el TXT que te muestre (`_vercel`).

## 2. DNS en el registrador

No cambies los nameservers si esos dominios ya tienen correo (MX), SPF o DKIM. Solo agrega o reemplaza los registros del sitio web. Copia el CNAME exacto que muestra Vercel en Domains: cada proyecto tiene un target propio (algo como `cname.vercel-dns-0.com` o un host `*.vercel-dns-017.com`). El valor de abajo es el habitual; si el panel muestra otro, usa ese.

| Dominio | Tipo | Host / Name | Valor |
|---|---|---|---|
| `cientoonce.com` | A | `@` | `76.76.21.21` |
| `www.cientoonce.com` | CNAME | `www` | el CNAME del proyecto |
| `cientoonce.com.mx` | A | `@` | `76.76.21.21` |
| `www.cientoonce.com.mx` | CNAME | `www` | el CNAME del proyecto |
| `admin.cientoonce.com.mx` | CNAME | `admin` | el mismo CNAME |
| `cientoonce.cr` | A | `@` | `76.76.21.21` |
| `www.cientoonce.cr` | CNAME | `www` | el CNAME del proyecto |
| `cientoonce.com.pa` | A | `@` | `76.76.21.21` |
| `www.cientoonce.com.pa` | CNAME | `www` | el CNAME del proyecto |

En el apex (el dominio sin subdominio) usa **A**, no CNAME. `.com`, `.mx`, `.cr` y `.pa` casi nunca aceptan CNAME o ALIAS en la raíz. Si el registrador sí ofrece ALIAS/ANAME en `@`, puedes usarlo hacia el mismo target CNAME de Vercel en lugar del A.

Si el dominio ya tiene un **AAAA** apuntando a otro sitio, quítalo. Vercel no atiende IPv6 en ese A, y quien resuelva por IPv6 no llegaría al proyecto.

El apex solo puede tener el A de Vercel. Un A extra al hosting anterior cierra el loop.

TTL: 300–3600 segundos mientras pruebas. La propagación puede tardar desde unos minutos hasta 48 horas.

## 3. Variables de entorno

En **Settings → Environment Variables**, para Production:

```
ADMIN_HOST=admin.cientoonce.com.mx
DEFAULT_COUNTRY=mx
SITE_URL=https://www.cientoonce.com.mx
```

`SITE_URL` no lleva barra final. El resto (Supabase, `IHO_COOKIE_SECRET`, Resend, Turnstile) va en el mismo proyecto. Redeploy después de guardarlas: el middleware lee `ADMIN_HOST` al arrancar.

## 4. Qué pasa cuando el usuario cambia de país

No hace falta un rewrite ni un proyecto por país.

1. El host decide el país. `cientoonce.com.pa` y `www.cientoonce.com.pa` se leen como Panamá (`countryFromHost` quita el `www`).
2. El selector del header navega a `https://www.<dominio-del-país>/?ref=selector`. Ese query guarda la cookie `iho_country_pref` por un año.
3. `www.cientoonce.com` (y el apex `cientoonce.com`) redirige por IP, en cualquier ruta: Costa Rica y Panamá a su sede, el resto a México. Quien entra directo a un dominio de país se queda ahí. Si su IP es de otro país con sede, aparece un aviso para cambiar, sin forzar el salto.

Ese header de geolocalización lo pone Vercel. En otro hosting la redirección automática no ocurre; el selector de país sí, porque solo usa el dominio. En local, `localhost` hace de puerta y `?geo=cr` o `?geo=pa` simula la IP.

## 5. Comprobar

Cuando Vercel marque cada dominio como **Valid Configuration**:

- `https://www.cientoonce.com` redirige a México, o a Costa Rica o Panamá si la IP es de ahí.
- `https://www.cientoonce.com.mx` abre México y no redirige por IP. El home no muestra `/mx` en la URL.
- `https://cientoonce.com.mx` redirige a `https://www.cientoonce.com.mx`.
- Lo mismo para `.cr` y `.pa`: contenido de ese país, en `www`.
- Desde México, el selector a Panamá termina en `https://www.cientoonce.com.pa/?ref=selector`.
- `https://admin.cientoonce.com.mx` abre el admin. En los dominios públicos, `/admin` no debe abrir el panel.
- `https://www.cientoonce.com.pa/sitemap.xml` lista URLs de `www.cientoonce.com.pa`, no de México.
