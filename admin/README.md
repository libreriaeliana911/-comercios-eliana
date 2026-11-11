# ADMIN ELIANA — conexión del catálogo (preparación)

Este panel vive en la rama `admin-eliana`. La página pública en `main` no fue modificada.

## Estado actual
- La interfaz inicial de administración todavía guarda productos y ofertas en el navegador.
- El sitio público usa el proyecto Supabase `bvowhugolrhjhusdvuzp` para el contador y envío de opiniones.
- Se agregó `supabase-schema.sql` para crear las tablas compartidas `productos` y `ofertas`, con lectura pública y escritura restringida a administradores autorizados.
- **Todavía no está conectado en producción**: crear las tablas y autorizar el usuario administrador requiere una acción desde el panel de Supabase. No se debe poner una clave `service_role` en el navegador.

## Activación necesaria en Supabase
1. Abrir el proyecto existente: https://supabase.com/dashboard/project/bvowhugolrhjhusdvuzp
2. Ir a SQL Editor, pegar el contenido completo de `supabase-schema.sql` y ejecutar.
3. En Authentication > Users, crear el usuario que se usará para entrar a ADMIN ELIANA.
4. Copiar el UUID de ese usuario y ejecutar en SQL Editor:
   `insert into public.admin_eliana_users (user_id) values ('UUID-DEL-USUARIO');`

Hasta completar estos pasos, no cargar datos reales ni considerar activo el panel conectado. La clave pública existente del sitio no permite crear tablas ni conceder permisos administrativos.


## Importar el catálogo actual

Antes de publicar los cambios, abrí Supabase SQL Editor y ejecutá una sola vez el archivo `admin/importar-catalogo-actual.sql`. Importa los productos que ya aparecen en los tres catálogos actuales, solo si ese comercio todavía no tiene productos en la tabla. No toca la tabla de opiniones.

## Estado de conexión

- El panel `admin/index.html` usa Supabase Auth para iniciar sesión y la tabla `productos`/ `ofertas` para administrar registros.
- Los tres catálogos públicos consultan los productos activos de Supabase; si una consulta no devuelve productos, conservan el catálogo HTML actual.
- Clientes: alta, edición, búsqueda, eliminación y exportación CSV de fichas cargadas desde el panel. No se importan contactos de WhatsApp ni se inventan clientes.
- Opiniones: lectura de hasta 100 opiniones recientes de la tabla existente, con estrellas y comentarios. No se atribuyen opiniones a fichas de clientes automáticamente.
- Fotos: carga desde galería/cámara al bucket público `admin-eliana-fotos` (máximo 6 MB; JPEG, PNG, WebP o GIF), además de URL manual.
- Estas tres funciones requieren ejecutar una vez `admin/completar-clientes-fotos-opiniones.sql` en Supabase SQL Editor.
- Los cambios están en la rama `admin-eliana`; no se publican hasta integrar esa rama en `main` y completar el despliegue de GitHub Pages.
