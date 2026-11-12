-- Caja Eliana: tabla de ventas
-- Ejecutar una sola vez en Supabase > SQL Editor.
create table if not exists public.ventas (
  id uuid primary key default gen_random_uuid(),
  comercio text not null check (comercio in ('Librería','Verdulería','Carnicería')),
  producto text not null default 'Sin especificar',
  cantidad numeric(12,2) not null check (cantidad > 0),
  precio_unitario numeric(12,2) not null check (precio_unitario >= 0),
  total numeric(14,2) not null check (total >= 0),
  forma_pago text not null check (forma_pago in ('Efectivo','Transferencia','Tarjeta')),
  created_at timestamptz not null default now()
);

create index if not exists ventas_comercio_fecha_idx
  on public.ventas (comercio, created_at desc);

alter table public.ventas enable row level security;

drop policy if exists "Admin puede consultar ventas" on public.ventas;
create policy "Admin puede consultar ventas"
  on public.ventas for select to authenticated
  using (true);

drop policy if exists "Admin puede registrar ventas" on public.ventas;
create policy "Admin puede registrar ventas"
  on public.ventas for insert to authenticated
  with check (true);

grant select, insert on public.ventas to authenticated;
