-- ADMIN ELIANA: esquema compartido para productos y ofertas
-- Ejecutar una sola vez en Supabase > SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.admin_eliana_users (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create or replace function public.is_admin_eliana()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.admin_eliana_users
    where user_id = auth.uid()
  );
$$;

revoke all on function public.is_admin_eliana() from public;
grant execute on function public.is_admin_eliana() to anon, authenticated;

create table if not exists public.productos (
  id uuid primary key default gen_random_uuid(),
  comercio text not null check (comercio in ('Verdulería','Carnicería','Librería y Juguetería')),
  nombre text not null,
  categoria text not null default 'General',
  precio text not null,
  unidad text not null default '',
  descripcion text not null default '',
  foto_url text not null default '',
  precio_anterior text not null default '',
  es_oferta boolean not null default false,
  disponible boolean not null default true,
  activo boolean not null default true,
  orden integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.ofertas (
  id uuid primary key default gen_random_uuid(),
  comercio text not null check (comercio in ('Verdulería','Carnicería','Librería y Juguetería')),
  titulo text not null,
  descripcion text not null default '',
  precio text not null default '',
  foto_url text not null default '',
  fecha_inicio date,
  fecha_fin date,
  activa boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.productos enable row level security;
alter table public.ofertas enable row level security;

drop policy if exists "Catalogo publico: productos activos" on public.productos;
create policy "Catalogo publico: productos activos"
on public.productos for select to anon, authenticated
using (activo = true);

drop policy if exists "Admin Eliana: gestionar productos" on public.productos;
create policy "Admin Eliana: gestionar productos"
on public.productos for all to authenticated
using (public.is_admin_eliana())
with check (public.is_admin_eliana());

drop policy if exists "Catalogo publico: ofertas activas" on public.ofertas;
create policy "Catalogo publico: ofertas activas"
on public.ofertas for select to anon, authenticated
using (activa = true);

drop policy if exists "Admin Eliana: gestionar ofertas" on public.ofertas;
create policy "Admin Eliana: gestionar ofertas"
on public.ofertas for all to authenticated
using (public.is_admin_eliana())
with check (public.is_admin_eliana());

grant select on public.productos, public.ofertas to anon, authenticated;
grant insert, update, delete on public.productos, public.ofertas to authenticated;

-- Después de crear el usuario administrador en Authentication > Users,
-- copiar su UUID y ejecutar:
-- insert into public.admin_eliana_users (user_id)
-- values ('PEGAR-AQUI-EL-UUID-DEL-ADMIN');
