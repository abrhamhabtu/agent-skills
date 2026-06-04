---
name: universal-docker-workflows
description: Docker and containerization best practices for any AI agent. Use when creating Dockerfiles, docker-compose files, or containerizing applications. Triggers on docker, container, compose, Dockerfile, or deployment tasks.
triggers:
  - docker
  - container
  - compose
  - Dockerfile
  - deployment
  - containerize
agent: universal
---

# Universal Docker Workflows

## When to Use

Creating Dockerfiles, docker-compose configurations, or containerizing applications. This skill ensures efficient, secure container builds.

## Steps

1. **Base image selection**
   - Use official images from Docker Hub
   - Prefer slim or alpine variants for smaller size
   - Use specific version tags, not `latest`
   - Consider distroless images for production security

2. **Multi-stage builds**
   - Build stage: install dependencies, compile code
   - Production stage: copy only artifacts, minimal runtime
   - Example:
     ```dockerfile
     # Build stage
     FROM node:20-alpine AS builder
     WORKDIR /app
     COPY package*.json ./
     RUN npm ci
     COPY . .
     RUN npm run build

     # Production stage
     FROM node:20-alpine AS runner
     WORKDIR /app
     ENV NODE_ENV=production
     COPY --from=builder /app/dist ./dist
     COPY --from=builder /app/node_modules ./node_modules
     COPY package.json ./
     EXPOSE 3000
     CMD ["node", "dist/main.js"]
     ```

3. **Layer caching**
   - Copy dependency files first, install, then copy source
   - Order Dockerfile commands from least to most frequently changing
   - Use `.dockerignore` to exclude unnecessary files

4. **Security**
   - Run as non-root user: `USER node` or create dedicated user
   - Use read-only filesystems where possible: `read_only: true`
   - Scan images with Trivy or Docker Scout
   - Don't bake secrets into images (use runtime env vars)

5. **Docker Compose**
   - Use Compose for local development and testing
   - Define health checks for all services
   - Use named volumes for persistent data
   - Set resource limits (memory, CPU) in production

6. **Health checks**
   - Add HEALTHCHECK to Dockerfile:
     ```dockerfile
     HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
       CMD curl -f http://localhost:3000/health || exit 1
     ```

## Pitfalls

- **Don't** use `latest` tag in production
- **Don't** run containers as root
- **Don't** include dev dependencies in production images
- **Don't** bake secrets or credentials into images
- **Don't** ignore `.dockerignore` (sends build context to daemon)

## Common Patterns

### Node.js Application
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
USER node
EXPOSE 3000
CMD ["node", "server.js"]
```

### Python Application
```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
USER app
EXPOSE 8000
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:app"]
```
