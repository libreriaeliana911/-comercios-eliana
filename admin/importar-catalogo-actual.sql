-- Importación única del catálogo que ya está publicado.
-- Solo agrega productos si el comercio todavía no tiene registros en Supabase.
-- No borra ni modifica opiniones ni otras tablas.

insert into public.productos (comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
select v.comercio,v.nombre,v.categoria,v.precio,v.unidad,v.precio_anterior,v.es_oferta,v.foto_url,v.activo,v.disponible
from (values
('Verdulería','Naranjas','Frutas','2000','por kilo','',false,'',true,true),
('Verdulería','Papas','Verduras','1200','por kilo','',false,'',true,true),
('Verdulería','Bananas','Frutas','2000','por kilo','2500',true,'',true,true),
('Verdulería','Tomates','Verduras','2200','por kilo','',false,'',true,true),
('Verdulería','Zanahorias','Verduras','900','por kilo','1200',true,'',true,true),
('Verdulería','Manzanas','Frutas','2800','por kilo','',false,'',true,true),
('Verdulería','Vino Resero','Bebidas','4000','2 cajas de 1 litro','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/resero.webp',true,true),
('Verdulería','Gaseosa Manaos','Bebidas','4500','2 botellas','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/manaos.webp',true,true)
) as v(comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
where not exists (select 1 from public.productos p where p.comercio='Verdulería');

insert into public.productos (comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
select v.comercio,v.nombre,v.categoria,v.precio,v.unidad,v.precio_anterior,v.es_oferta,v.foto_url,v.activo,v.disponible
from (values
('Carnicería','Asado','Carne vacuna','8500','por kilo','',false,'',true,true),
('Carnicería','Pollo entero','Pollo','3800','por kilo','',false,'',true,true),
('Carnicería','Milanesas preparadas','Preparados','6000','por kilo','7000',true,'',true,true),
('Carnicería','Carne picada','Carne vacuna','7200','por kilo','',false,'',true,true),
('Carnicería','Vino Resero','Bebidas','4000','2 cajas de 1 litro','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/resero.webp',true,true),
('Carnicería','Gaseosa Manaos','Bebidas','4500','2 botellas','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/manaos.webp',true,true)
) as v(comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
where not exists (select 1 from public.productos p where p.comercio='Carnicería');

insert into public.productos (comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
select v.comercio,v.nombre,v.categoria,v.precio,v.unidad,v.precio_anterior,v.es_oferta,v.foto_url,v.activo,v.disponible
from (values
('Librería y Juguetería','Resma A4','Librería','5500','paquete x 500 hojas','',false,'',true,true),
('Librería y Juguetería','Cuaderno','Escolar','3800','unidad · modelo ilustrativo','',false,'',true,true),
('Librería y Juguetería','Lápices de colores','Escolar','2000','caja','2500',true,'',true,true),
('Librería y Juguetería','Lapiceras','Librería','700','unidad','',false,'',true,true),
('Librería y Juguetería','Juguete sorpresa','Juguetes','4500','unidad · ejemplo','5500',true,'',true,true)
) as v(comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
where not exists (select 1 from public.productos p where p.comercio='Librería y Juguetería');

