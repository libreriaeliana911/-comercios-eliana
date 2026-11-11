-- Importación inicial del catálogo actual de COMERCIOS ELIANA
-- Ejecutar una sola vez. No modifica las opiniones ni elimina datos.

insert into public.productos (comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
select * from (values
('Verdulería','Naranjas','Frutas','$2.000','por kilo','',false,'',true,true),
('Verdulería','Papas','Verduras','$1.200','por kilo','',false,'',true,true),
('Verdulería','Bananas','Frutas','$2.000','por kilo','$2.500',true,'',true,true),
('Verdulería','Tomates','Verduras','$2.200','por kilo','',false,'',true,true),
('Verdulería','Zanahorias','Verduras','$900','por kilo','$1.200',true,'',true,true),
('Verdulería','Manzanas','Frutas','$2.800','por kilo','',false,'',true,true),
('Verdulería','Vino Resero','Bebidas','$4.000','2 cajas de 1 litro','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/resero.webp',true,true),
('Verdulería','Gaseosa Manaos','Bebidas','$4.500','2 botellas','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/manaos.webp',true,true)
) as nuevos(comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
where not exists (select 1 from public.productos p where p.comercio='Verdulería');

insert into public.productos (comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
select * from (values
('Carnicería','Asado','Carne vacuna','$8.500','por kilo','',false,'',true,true),
('Carnicería','Pollo entero','Pollo','$3.800','por kilo','',false,'',true,true),
('Carnicería','Milanesas preparadas','Preparados','$6.000','por kilo','$7.000',true,'',true,true),
('Carnicería','Carne picada','Carne vacuna','$7.200','por kilo','',false,'',true,true),
('Carnicería','Vino Resero','Bebidas','$4.000','2 cajas de 1 litro','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/resero.webp',true,true),
('Carnicería','Gaseosa Manaos','Bebidas','$4.500','2 botellas','',true,'https://libreriaeliana911.github.io/-comercios-eliana/images/manaos.webp',true,true)
) as nuevos(comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
where not exists (select 1 from public.productos p where p.comercio='Carnicería');

insert into public.productos (comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
select * from (values
('Librería y Juguetería','Resma A4','Librería','$5.500','paquete x 500 hojas','',false,'',true,true),
('Librería y Juguetería','Cuaderno','Escolar','$3.800','unidad · modelo ilustrativo','',false,'',true,true),
('Librería y Juguetería','Lápices de colores','Escolar','$2.000','caja','$2.500',true,'',true,true),
('Librería y Juguetería','Lapiceras','Librería','$700','unidad','',false,'',true,true),
('Librería y Juguetería','Juguete sorpresa','Juguetes','$4.500','unidad · ejemplo','$5.500',true,'',true,true)
) as nuevos(comercio,nombre,categoria,precio,unidad,precio_anterior,es_oferta,foto_url,activo,disponible)
where not exists (select 1 from public.productos p where p.comercio='Librería y Juguetería');
