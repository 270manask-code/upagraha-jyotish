create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text,
  role text not null default 'user' check (role in ('user','admin')),
  created_at timestamptz default now()
);
create table if not exists charts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  dob date not null,
  tob time not null,
  place text not null,
  latitude double precision,
  longitude double precision,
  convention text not null,
  result_json jsonb not null,
  created_at timestamptz default now()
);
create table if not exists posts (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  slug text unique not null,
  content text not null,
  published boolean default false,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);
create table if not exists reactions (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references posts(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  reaction text not null check (reaction in ('like','dislike')),
  created_at timestamptz default now(),
  unique(post_id,user_id)
);

alter table profiles enable row level security;
alter table charts enable row level security;
alter table posts enable row level security;
alter table reactions enable row level security;

create policy "own profile" on profiles for select using (auth.uid()=id);
create policy "own charts" on charts for select using (auth.uid()=user_id);
create policy "insert own charts" on charts for insert with check (auth.uid()=user_id);
create policy "public published posts" on posts for select using (published=true);
create policy "own reactions" on reactions for all using (auth.uid()=user_id) with check (auth.uid()=user_id);

-- IMPORTANT: Admin CRUD/search policies should be created using a secure role-checking
-- function or separate server-side endpoint. Do not trust a frontend email check.
