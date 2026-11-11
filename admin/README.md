# ADMIN ELIANA

Panel privado para administrar los catálogos de Verdulería Eliana, Carnicería Eliana y Librería y Juguetería Eliana.

## Funciones

- Acceso privado con Supabase Auth; solo usuarios incluidos en `admin_eliana_users` pueden administrar.
- Productos: crear, editar, cambiar precios, categoría, descripción, unidad y foto; marcar ofertas, pausar disponibilidad y eliminar.
- Categorías: renombrar o eliminar una categoría para un comercio (los productos eliminados de categoría pasan a General).
- Ofertas: crear, editar, pausar, activar, programar fecha de inicio y vencimiento, agregar descripción y URL de imagen, eliminar.
- Catálogos públicos: los tres comercios leen productos y ofertas vigentes de Supabase. Los cambios guardados en el panel se reflejan sin editar HTML ni publicar GitHub.
- Clientes: crear, editar, buscar, filtrar, eliminar y exportar a CSV. Son fichas cargadas manualmente; no se importan conversaciones ni contactos de WhatsApp.
- Opiniones: ver hasta 100 opiniones recientes, promedio, distribución de estrellas y comentarios. No se atribuyen opiniones anónimas a clientes.
- Fotos de productos: cargar desde cámara/galería o pegar una URL. Máximo 6 MB, JPEG, PNG, WebP o GIF.
- Instalación PWA: se puede instalar desde el navegador compatible en computadora o teléfono.

## Configuración Supabase

Proyecto: `bvowhugolrhjhusdvuzp`.

Archivos SQL:
1. `supabase-schema.sql`: tablas de productos/ofertas, permisos y función de administrador.
2. `importar-catalogo-actual.sql`: importa el catálogo de ejemplo si ese comercio aún no tiene productos.
3. `completar-clientes-fotos-opiniones.sql`: tabla de clientes, lectura privada de opiniones y bucket de fotos.

Los scripts 1, 2 y 3 deben ejecutarse desde Supabase SQL Editor. El usuario administrador debe existir en Authentication > Users y su UUID debe estar en `public.admin_eliana_users`.

## Acceso

Una vez publicada la rama en GitHub Pages, abrir:

`https://libreriaeliana911.github.io/-comercios-eliana/admin/`

Ingresar con el correo y contraseña creados en Supabase Authentication. No guardar ni publicar claves `service_role`; el panel usa la clave pública y las políticas RLS.

## Verificaciones realizadas en el código

- Sintaxis JavaScript de panel, tres catálogos públicos y página principal.
- Lectura pública de productos activos y ofertas activas por comercio.
- Filtrado de vigencia de ofertas en el catálogo público.
- Escrituras administrativas protegidas por RLS.
- El panel y los catálogos se mantienen en la rama de preparación hasta completar pruebas reales en el proyecto Supabase y la publicación.
