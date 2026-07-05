-- Run in Supabase SQL Editor before first use

create table if not exists zrostack_users (
  id bigint generated always as identity primary key,
  email text unique not null,
  password text not null,
  name text,
  role text default 'user',
  plan text default 'free',
  credits integer default 50,
  apps_used integer default 0,
  referrals integer default 0,
  referral_code text,
  wa_number text,
  created_at timestamptz default now(),
  last_login timestamptz
);

alter table zrostack_users enable row level security;
create policy "Public access" on zrostack_users for all using (true) with check (true);

insert into zrostack_users (email, password, name, role, plan, credits, referral_code)
values ('admin@zrostack.com', 'admin123', 'Maan Al-Khawarizmi', 'admin', 'pro', 500, 'ZROSTK-MAAN')
on conflict (email) do nothing;
