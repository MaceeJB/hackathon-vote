-- Hackathon Build-Off — Supabase setup
-- Paste this whole file into the Supabase SQL Editor and click "Run".

-- 1. The votes table
create table if not exists public.votes (
  id          bigint generated always as identity primary key,
  created_at  timestamptz not null default now(),
  name        text        not null,
  pick1       smallint    not null check (pick1 between 1 and 9),
  pick2       smallint    not null check (pick2 between 1 and 9),
  pick3       smallint    not null check (pick3 between 1 and 9)
);

-- 2. Turn on row-level security, then allow the public (anon) key to read + insert.
--    Anon can add a vote and read results, but cannot update or delete.
alter table public.votes enable row level security;

drop policy if exists "anon can read votes"   on public.votes;
drop policy if exists "anon can insert votes" on public.votes;

create policy "anon can read votes"
  on public.votes for select
  to anon
  using (true);

create policy "anon can insert votes"
  on public.votes for insert
  to anon
  with check (true);

-- 3. Broadcast inserts over Realtime so the results screen updates live.
alter publication supabase_realtime add table public.votes;
