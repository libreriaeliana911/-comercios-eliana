-- ADMIN ELIANA: importar ofertas anteriores escritas directamente en las páginas.
-- UNA SOLA CONSULTA para evitar "Only singular query allowed".
-- Excluye tarjetas de ejemplo y evita duplicados.

with ofertas_anteriores(titulo, precio, comercio, descripcion, ubicaciones) as (
  values
    ('Bananas', '$2.000 / kg', 'Verdulería', 'Antes $2.500 / kg', '{"verduleria":{"posicion":1}}'::jsonb),
    ('Zanahorias', '$900 / kg', 'Verdulería', 'Antes $1.200 / kg', '{"verduleria":{"posicion":2}}'::jsonb),
    ('Milanesas preparadas', '$6.000 / kg', 'Carnicería', 'Antes $7.000 / kg', '{"carniceria":{"posicion":1}}'::jsonb),
    ('Lápices de colores', '$2.000 / caja', 'Librería y Juguetería', 'Antes $2.500 / caja', '{"libreria":{"posicion":1}}'::jsonb),
    ('Vino Resero', '$4.000 las 2 cajas', 'Verdulería', 'Promoción: 2 cajas de 1 litro', '{"inicio":{"posicion":1},"verduleria":{"posicion":3},"carniceria":{"posicion":2}}'::jsonb),
    ('Gaseosa Manaos', '$4.500 las 2 botellas', 'Verdulería', 'Promoción: 2 botellas', '{"inicio":{"posicion":2},"verduleria":{"posicion":4},"carniceria":{"posicion":3}}'::jsonb)
),
insertadas as (
  insert into public.ofertas
    (titulo, precio, comercio, descripcion, foto_url, fecha_inicio, fecha_fin, ubicaciones, activa)
  select
    o.titulo, o.precio, o.comercio, o.descripcion, '', current_date, null, o.ubicaciones, true
  from ofertas_anteriores o
  where not exists (
    select 1 from public.ofertas existente
    where lower(trim(existente.titulo)) = lower(trim(o.titulo))
      and lower(trim(existente.comercio)) = lower(trim(o.comercio))
  )
  returning id
)
select titulo, precio, comercio, ubicaciones, activa
from public.ofertas
where titulo in ('Bananas','Zanahorias','Milanesas preparadas','Lápices de colores','Vino Resero','Gaseosa Manaos')
order by titulo;
