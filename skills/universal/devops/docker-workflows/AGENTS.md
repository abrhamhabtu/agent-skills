# Universal Docker Workflows

Use when creating Dockerfiles or containerizing applications.

## Rules

1. Use official images, specific version tags (not `latest`)
2. Multi-stage builds: build stage + production stage
3. Copy dependencies first for layer caching
4. Run as non-root user
5. Don't bake secrets into images
6. Add health checks
7. Use `.dockerignore` to reduce build context

## Anti-Patterns

- `latest` tag in production
- Running as root
- Dev dependencies in production images
- Secrets in images
- Ignoring `.dockerignore`
