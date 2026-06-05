---
name: universal-security-hardening
description: Security best practices for AI agent projects: secrets management, auth, input validation, and audit patterns. Use when building anything that handles user data, payments, or external APIs.
triggers:
  - security
  - auth
  - authentication
  - secrets
  - encryption
  - oauth
  - jwt
  - password
  - vulnerability
  - audit
agent: universal
---

# Security Hardening

## When to Use

Any project handling user data, authentication, payments, external APIs, or deployed to production.

## Core Principles

1. **Never trust user input**
2. **Least privilege access**
3. **Defense in depth**
4. **Fail securely**
5. **Security through transparency**

## Checklist

### Authentication

- [ ] Use OAuth 2.0 / OpenID Connect for social auth
- [ ] Implement MFA for sensitive accounts
- [ ] Use secure session management (HTTPOnly, Secure, SameSite cookies)
- [ ] Rate limit login attempts (exponential backoff)
- [ ] Password requirements: 12+ chars, complexity rules
- [ ] Use bcrypt/Argon2 for password hashing (never MD5/SHA1)

### Authorization

- [ ] Implement RBAC (Role-Based Access Control)
- [ ] Verify permissions on every request
- [ ] Use principle of least privilege
- [ ] Never rely on client-side checks alone

### Secrets Management

```bash
# NEVER commit secrets
echo ".env" >> .gitignore
echo "*.pem" >> .gitignore
echo ".env.local" >> .gitignore

# Use environment variables
export API_KEY="$(cat .env | grep API_KEY | cut -d= -f2)"

# For production, use:
# - AWS Secrets Manager
# - HashiCorp Vault
# - Doppler
# - 1Password Secrets Automation
```

### Input Validation

```typescript
// Use Zod for runtime validation
import { z } from 'zod'

const userSchema = z.object({
  email: z.string().email(),
  name: z.string().min(1).max(100),
  age: z.number().int().min(0).max(150)
})

// Validate all inputs
const result = userSchema.safeParse(req.body)
if (!result.success) {
  return res.status(400).json({ errors: result.error.issues })
}
```

### API Security

- [ ] Use HTTPS everywhere
- [ ] Implement CORS properly (whitelist origins)
- [ ] Add security headers:
  ```
  Strict-Transport-Security: max-age=31536000; includeSubDomains
  Content-Security-Policy: default-src 'self'
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  ```
- [ ] Rate limit all endpoints
- [ ] Validate Content-Type
- [ ] Use API versioning

### Database Security

- [ ] Use parameterized queries (prevent SQL injection)
- [ ] Enable RLS (Row Level Security)
- [ ] Encrypt sensitive data at rest
- [ ] Regular backups with encryption
- [ ] Audit logging for sensitive operations

### AI-Specific Security

- [ ] Sanitize prompts (prevent prompt injection)
- [ ] Rate limit API calls per user
- [ ] Validate AI outputs before using
- [ ] Implement output filtering
- [ ] Monitor for abuse patterns
- [ ] Use content moderation APIs

```typescript
// Prompt injection prevention
function sanitizePrompt(userInput: string): string {
  // Remove potential injection markers
  const cleaned = userInput
    .replace(/\{\{.*?\}\}/g, '')
    .replace(/<.*?>/g, '')
    .slice(0, 1000) // Limit length
  
  return cleaned
}
```

## Audit Checklist

Before shipping:

- [ ] Run `npm audit` or equivalent
- [ ] Check for secrets in git history (`git-secrets`, `truffleHog`)
- [ ] Review dependency licenses
- [ ] Test authentication flows
- [ ] Verify CORS settings
- [ ] Check security headers
- [ ] Review error messages (don't leak internals)
- [ ] Test rate limiting
- [ ] Verify backup/recovery procedures

## Tools

- **Snyk**: Dependency vulnerability scanning
- **OWASP ZAP**: Web app security testing
- **Burp Suite**: Professional security testing
- **GitGuardian**: Secret detection in git
- **Dependabot**: Automated dependency updates

## Pitfalls

- Don't roll your own crypto
- Don't trust client-side validation
- Don't expose stack traces in production
- Don't log sensitive data
- Don't use default credentials
- Don't ignore security warnings from tools
