create table if not exists public.lotto_draw_results (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  numbers int[] not null,
  bonus int not null check (bonus between 1 and 45)
);

alter table public.lotto_draw_results enable row level security;

create policy "Public read lotto draw results"
  on public.lotto_draw_results
  for select
  using (true);

create policy "Public insert lotto draw results"
  on public.lotto_draw_results
  for insert
  with check (true);
