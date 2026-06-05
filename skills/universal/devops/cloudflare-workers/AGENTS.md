# Cloudflare Workers (Quick Reference)

## Commands

```bash
wrangler login          # Auth
wrangler dev            # Local dev
wrangler deploy         # Deploy
wrangler tail           # Logs
wrangler d1 create db   # Create database
```

## Key APIs

| Service | Use Case | Consistency |
|---------|----------|-------------|
| KV | Config, caching | Eventual |
| D1 | Relational data | Strong |
| Durable Objects | State, WS | Strong |
| Queues | Background jobs | At-least-once |
| R2 | Object storage | Strong |

## Quick Patterns

```typescript
// CORS headers
const cors = { 'Access-Control-Allow-Origin': '*' }

// JSON response
return Response.json(data, { headers: cors })

// Environment binding
const value = await env.KV_NAMESPACE.get('key')
```

## Limits

- CPU: 50ms (free) / 30s (paid)
- Memory: 128MB
- Subrequests: 50 per request
- KV reads: Unlimited
- D1 queries: 100k/day (free)
