# Universal API Design

Use when designing, building, or reviewing APIs.

## Rules

1. REST for CRUD, GraphQL for complex nested data, tRPC for type-safe internal
2. Use nouns for resources, plural names, proper HTTP methods
3. Consistent JSON envelope: `{ data, error, meta }`
4. Structured errors with codes and details
5. OAuth 2.0/JWT for auth, API keys for service-to-service
6. Rate limit with 429 + Retry-After header
7. Document with OpenAPI/Swagger

## Anti-Patterns

- Verbs in URL paths
- 200 OK for errors
- Exposing stack traces
- Unpaginated list endpoints
- Breaking changes without versioning
