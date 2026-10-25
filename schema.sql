-- Planner Escolar Familiar v1.0.0
-- Execute no SQL Editor do projeto Supabase que você já usa.
-- Uma tabela compartilhada por todos os usuários autenticados do projeto.
create table if not exists public.school_planner_items (
  id uuid primary key default gen_random_uuid(),
  subject text not null,
  exam_date date not null,
  title text not null,
  topics text not null default '',
  study_notes text not null default '',
  status text not null default 'A estudar'
    check (status in ('A estudar','Revisando','Estudado','Realizada')),
  priority text not null default 'normal'
    check (priority in ('normal','alta','baixa')),
  created_by uuid not null references auth.users(id) on delete restrict,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists school_planner_items_exam_date_idx
  on public.school_planner_items (exam_date);
alter table public.school_planner_items enable row level security;
drop policy if exists "family users can read school planner" on public.school_planner_items;
drop policy if exists "family users can insert school planner" on public.school_planner_items;
drop policy if exists "family users can update school planner" on public.school_planner_items;
drop policy if exists "family users can delete school planner" on public.school_planner_items;
create policy "family users can read school planner"
  on public.school_planner_items for select to authenticated using (true);
create policy "family users can insert school planner"
  on public.school_planner_items for insert to authenticated with check (auth.uid() = created_by);
create policy "family users can update school planner"
  on public.school_planner_items for update to authenticated
  using (true) with check (auth.uid() = updated_by);
create policy "family users can delete school planner"
  on public.school_planner_items for delete to authenticated using (true);
grant select, insert, update, delete on public.school_planner_items to authenticated;
