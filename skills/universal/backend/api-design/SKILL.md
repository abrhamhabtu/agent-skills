---
name: universal-api-design
description: REST and GraphQL API design guidelines for any AI agent. Use when designing, building, or reviewing APIs. Triggers on API, REST, GraphQL, endpoint, route, or backend tasks.
triggers:
  - api
  - rest
  - graphql
  - endpoint
  - route
  - backend
  - server
agent: universal
---

# Universal API Design

## When to Use

Designing, building, or reviewing APIs. This skill ensures consistent, scalable API design regardless of framework.

## Steps

1. **Choose the right style**
   - REST for resource-oriented CRUD operations
   - GraphQL for complex, nested data requirements
   - tRPC for type-safe internal APIs (TypeScript fullstack)
   - gRPC for high-performance internal microservices

2. **REST conventions**
   - Use nouns for resources, not verbs: `/users` not `/getUsers`
   - Use plural resource names: `/orders` not `/order`
   - Use HTTP methods correctly: GET, POST, PUT/PATCH, DELETE
   - Use nested routes for relationships: `/users/123/orders`
   - Version your API: `/v1/users`

3. **Request/Response format**
   - Use JSON for request/response bodies
   - Include consistent envelope: `{ data, error, meta }`
   - Use camelCase for JSON keys
   - Return appropriate HTTP status codes

4. **Error handling**
   - Use standard HTTP status codes (4xx client, 5xx server)
   - Include structured error responses:
     ```json
     {
       "error": {
         "code": "VALIDATION_ERROR",
         "message": "Invalid input",
         "details": [{ "field": "email", "message": "Invalid email format" }]
       }
     }
     ```

5. **Authentication**
   - Use OAuth 2.0 / OIDC for third-party auth
   - Use JWT for stateless auth (keep payloads small)
   - Use API keys for service-to-service auth
   - Always use HTTPS in production

6. **Rate limiting**
   - Implement rate limiting per user/API key
   - Return `429 Too Many Requests` with `Retry-After` header
   - Document rate limits in API docs

7. **Documentation**
   - Use OpenAPI/Swagger for REST APIs
   - Use GraphQL introspection for GraphQL
   - Include examples for all endpoints
   - Document error cases

## Pitfalls

- **Don't** use verbs in URL paths
- **Don't** return 200 OK for errors
- **Don't** expose stack traces or internal details in errors
- **Don't** ignore pagination for list endpoints
- **Don't** break backward compatibility without versioning

## Status Codes

| Code | Use Case |
|------|----------|
| 200 | Success (GET, PUT, PATCH, DELETE) |
| 201 | Created (POST) |
| 204 | No Content (DELETE) |
| 400 | Bad Request (validation error) |
| 401 | Unauthorized (auth required) |
| 403 | Forbidden (insufficient permissions) |
| 404 | Not Found |
| 409 | Conflict (duplicate resource) |
| 422 | Unprocessable Entity (semantic error) |
| 429 | Too Many Requests (rate limit) |
| 500 | Internal Server Error |
