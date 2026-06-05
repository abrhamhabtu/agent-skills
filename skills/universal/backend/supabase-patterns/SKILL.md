---
name: universal-supabase-patterns
description: Production patterns for Supabase (Postgres, auth, realtime, edge functions). Use when building backends with Supabase or migrating from Firebase.
triggers:
  - supabase
  - postgres
  - postgresql
  - auth
  - realtime
  - edge-functions
  - storage
  - row-level-security
  - rls
agent: universal
---

# Supabase Backend Patterns

## When to Use

Any project using Supabase as the backend: database, auth, storage, realtime, or edge functions.

## Core Patterns

### 1. Database Design

- Use UUID primary keys (gen_random_uuid())
- Enable RLS on every table from day one
- Use schemas to separate concerns (public, auth, internal)
- Set up proper indexes for common queries
- Use composite keys for join tables

### 2. Row Level Security (RLS)

```sql
-- Enable RLS
alter table profiles enable row level security;

-- Policy: users can read own profile
create policy "Users can view own profile"
  on profiles for select
  using (auth.uid() = user_id);

-- Policy: users can update own profile
create policy "Users can update own profile"
  on profiles for update
  using (auth.uid() = user_id);
```

### 3. Auth Patterns

- Always use server-side auth (never expose service role key)
- Implement refresh token rotation
- Use OAuth providers for social login
- Set up email templates for confirmation/password reset
- Handle auth state changes globally

### 4. Edge Functions

```typescript
// supabase/functions/api/index.ts
import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  const supabase = createClient(
    Deno.env.get('SUPABASE_URL')!,
    Deno.env.get('SUPABASE_ANON_KEY')!
  )
  
  // Verify auth
  const { data: { user } } = await supabase.auth.getUser(
    req.headers.get('authorization')?.replace('Bearer ', '')
  )
  
  if (!user) {
    return new Response('Unauthorized', { status: 401 })
  }
  
  // Your logic here
  return new Response(JSON.stringify({ success: true }))
})
```

### 5. Realtime Subscriptions

```typescript
const subscription = supabase
  .channel('table_changes')
  .on('postgres_changes', 
    { event: '*', schema: 'public', table: 'messages' },
    (payload) => console.log('Change received!', payload)
  )
  .subscribe()
```

### 6. Storage Patterns

- Use bucket policies for access control
- Generate signed URLs for private files
- Implement image transformations for thumbnails
- Organize files by user_id prefix

## Pitfalls

- Don't disable RLS "temporarily" (you'll forget)
- Don't use service role key in client-side code
- Don't forget to handle auth state edge cases
- Don't query large tables without pagination
- Don't ignore database migrations (use supabase CLI)

## Testing

1. Test RLS policies with different user roles
2. Verify edge function cold start times
3. Test realtime reconnection behavior
4. Load test auth flows
5. Validate storage upload limits
