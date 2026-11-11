# ADMIN ELIANA — prototipo inicial

Este directorio se creó en la rama `admin-eliana`, separado de la página pública.

## Qué incluye esta primera etapa
- Panel adaptable a celular y computadora.
- Secciones Inicio, Productos, Ofertas, Clientes y Opiniones.
- Alta, edición, eliminación y cambio de stock de productos.
- Selección de fotos desde el dispositivo.
- Alta, pausa y eliminación de ofertas.
- Manifest y service worker para preparar la instalación como PWA.

## Importante
Esta versión es un prototipo de interfaz. Los cambios se guardan únicamente en el navegador mediante localStorage y **no** modifican los catálogos públicos ni se sincronizan entre dispositivos. No hay autenticación real; no cargar datos personales ni información real de clientes.

## Antes de usarla en el negocio
Hay que conectar autenticación segura, base de datos y almacenamiento de imágenes (por ejemplo, Supabase), definir permisos/RLS y enlazar los catálogos públicos a esas tablas. También hay que integrar las opiniones existentes. La rama de prototipo no publica ni altera el sitio actual.
