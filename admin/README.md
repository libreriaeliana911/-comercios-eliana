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
