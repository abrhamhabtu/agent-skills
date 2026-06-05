# Supabase Patterns (Quick Reference)

## Quick Setup

```bash
# CLI
npm install -g supabase
supabase login
supabase init
supabase start  # local dev
```

## Auth

```typescript
const { data, error } = await supabase.auth.signInWithPassword({
  email: 'user@example.com',
  password: 'password'
})
```

## RLS Template

```sql
alter table my_table enable row level security;
create policy "Users can CRUD own rows"
  on my_table for all
  using (auth.uid() = user_id);
```

## Edge Function

```bash
supabase functions new my-function
supabase functions serve my-function
supabase functions deploy my-function
```

## Key Rules

- Enable RLS on ALL tables
- Never expose service role key client-side
- Use UUIDs for primary keys
- Index foreign key columns
- Test auth edge cases
