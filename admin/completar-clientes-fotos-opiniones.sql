-- ADMIN ELIANA: completar clientes, opiniones y fotos
-- Ejecutar una sola vez en Supabase > SQL Editor.

create table if not exists public.clientes (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  telefono text not null default '',
  comercio text not null default '',
  notas text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.clientes enable row level security;
drop policy if exists "Admin Eliana: gestionar clientes" on public.clientes;
create policy "Admin Eliana: gestionar clientes"
on public.clientes for all to authenticated
using (public.is_admin_eliana())
with check (public.is_admin_eliana());
grant select, insert, update, delete on public.clientes to authenticated;

-- Permite que el panel vea opiniones existentes. No cambia ni elimina opiniones.
-- No se modifica la política pública que permite enviar opiniones desde la web.
drop policy if exists "Admin Eliana: leer opiniones" on public.opiniones;
create policy "Admin Eliana: leer opiniones"
on public.opiniones for select to authenticated
using (public.is_admin_eliana());
grant select on public.opiniones to authenticated;

-- Almacenamiento de imágenes de productos (lectura pública para mostrarlas en catálogos).
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('admin-eliana-fotos', 'admin-eliana-fotos', true, 6291456, array['image/jpeg','image/png','image/webp','image/gif'])
on conflict (id) do update set public = true, file_size_limit = 6291456, allowed_mime_types = array['image/jpeg','image/png','image/webp','image/gif'];

drop policy if exists "Fotos Eliana: lectura publica" on storage.objects;
create policy "Fotos Eliana: lectura publica"
on storage.objects for select to anon, authenticated
using (bucket_id = 'admin-eliana-fotos');

drop policy if exists "Fotos Eliana: admin subir" on storage.objects;
create policy "Fotos Eliana: admin subir"
on storage.objects for insert to authenticated
with check (bucket_id = 'admin-eliana-fotos' and public.is_admin_eliana());

drop policy if exists "Fotos Eliana: admin actualizar" on storage.objects;
create policy "Fotos Eliana: admin actualizar"
on storage.objects for update to authenticated
using (bucket_id = 'admin-eliana-fotos' and public.is_admin_eliana())
with check (bucket_id = 'admin-eliana-fotos' and public.is_admin_eliana());

drop policy if exists "Fotos Eliana: admin borrar" on storage.objects;
create policy "Fotos Eliana: admin borrar"
on storage.objects for delete to authenticated
using (bucket_id = 'admin-eliana-fotos' and public.is_admin_eliana());
