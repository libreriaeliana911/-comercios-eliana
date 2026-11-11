-- ADMIN ELIANA: ubicaciones multiples y posicion de ofertas
-- Ejecutar una sola vez en Supabase > SQL Editor.
alter table public.ofertas
  add column if not exists ubicaciones jsonb not null default '{}'::jsonb;

comment on column public.ofertas.ubicaciones is
  'Paginas publicas donde se muestra cada oferta y su posicion: inicio, verduleria, carniceria, libreria.';
