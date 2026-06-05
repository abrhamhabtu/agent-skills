---
name: universal-cloudflare-workers
description: Deploy serverless functions on Cloudflare Workers with Durable Objects, KV, D1, and Queues. Use when building edge-compute backends, APIs, or distributed systems.
triggers:
  - cloudflare
  - workers
  - edge
  - serverless
  - wrangler
  - durable-objects
  - kv
  - d1
agent: universal
---

# Cloudflare Workers Patterns

## When to Use

Building serverless APIs, edge proxies, scheduled jobs, or real-time collaboration systems that need to run close to users globally.

## Setup

```bash
# Install Wrangler
npm install -g wrangler

# Authenticate
wrangler login

# Create project
npm create cloudflare@latest my-project

# Dev server
wrangler dev

# Deploy
wrangler deploy
```

## Core Patterns

### 1. Basic Worker

```typescript
export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url)
    
    if (url.pathname === '/api/hello') {
      return Response.json({ message: 'Hello from the edge!' })
    }
    
    return new Response('Not Found', { status: 404 })
  }
}
```

### 2. Durable Objects (Stateful)

```typescript
// Real-time collaboration, game rooms, chat
export class ChatRoom implements DurableObject {
  constructor(private state: DurableObjectState) {}
  
  async fetch(request: Request): Promise<Response> {
    const webSocketPair = new WebSocketPair()
    const [client, server] = Object.values(webSocketPair)
    
    this.state.acceptWebSocket(server)
    
    return new Response(null, {
      status: 101,
      webSocket: client
    })
  }
  
  async webSocketMessage(ws: WebSocket, message: string) {
    // Broadcast to all connected clients
    ws.serializeAttachment({ ...ws.deserializeAttachment(), messages: [...] })
  }
}
```

### 3. KV Storage

```typescript
// Read
const value = await env.MY_KV.get('key')

// Write with TTL
await env.MY_KV.put('key', 'value', { expirationTtl: 3600 })

// List
const list = await env.MY_KV.list({ prefix: 'user:' })
```

### 4. D1 Database

```typescript
// Query
const { results } = await env.DB.prepare(
  'SELECT * FROM users WHERE id = ?'
).bind(userId).all()

// Batch
const batch = [
  env.DB.prepare('INSERT INTO users (name) VALUES (?)').bind('Alice'),
  env.DB.prepare('INSERT INTO users (name) VALUES (?)').bind('Bob')
]
await env.DB.batch(batch)
```

### 5. Queues

```typescript
// Producer
await env.MY_QUEUE.send({ userId: '123', action: 'process' })

// Consumer (in separate worker)
export default {
  async queue(batch: MessageBatch, env: Env): Promise<void> {
    for (const message of batch.messages) {
      await processMessage(message.body)
      message.ack()
    }
  }
}
```

## Architecture Patterns

### API Gateway Pattern
```
Client → Cloudflare Worker (auth/rate limit) → 
  ├─ Durable Object (real-time)
  ├─ D1 (relational data)
  ├─ KV (caching)
  └─ External API (fallback)
```

### Scheduled Jobs
```typescript
export default {
  async scheduled(event: ScheduledEvent, env: Env) {
    // Runs on CRON schedule
    await env.DB.prepare('DELETE FROM temp_logs WHERE created_at < ?')
      .bind(Date.now() - 86400000)
      .run()
  }
}
```

## Pitfalls

- Cold starts are fast but not zero (sub-50ms)
- Durable Objects have single-threaded execution
- KV is eventually consistent (not for counters)
- D1 has connection limits (use connection pooling)
- Free tier has subrequest limits

## Testing

```bash
# Unit tests with vitest
npm install -D vitest @cloudflare/vitest-pool-workers

# Integration tests
wrangler dev --test-scheduled
```
