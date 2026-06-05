# Security Hardening (Quick Reference)

## Auth Checklist

- [ ] OAuth 2.0 for social login
- [ ] MFA for sensitive accounts
- [ ] HTTPOnly, Secure, SameSite cookies
- [ ] Rate limit logins (exponential backoff)
- [ ] bcrypt/Argon2 for passwords
- [ ] RBAC for authorization

## Secrets

```bash
# Never commit
echo ".env" >> .gitignore

# Use:
# - AWS Secrets Manager
# - HashiCorp Vault
# - Doppler
# - 1Password
```

## Input Validation

```typescript
import { z } from 'zod'
const schema = z.object({
  email: z.string().email(),
  name: z.string().min(1).max(100)
})
```

## Security Headers

```
Strict-Transport-Security: max-age=31536000
Content-Security-Policy: default-src 'self'
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
```

## AI-Specific

- Sanitize prompts (prevent injection)
- Rate limit API calls
- Validate AI outputs
- Monitor for abuse

## Pre-Ship Audit

- [ ] `npm audit`
- [ ] Check for secrets in git
- [ ] Test auth flows
- [ ] Verify CORS
- [ ] Check headers
- [ ] Test rate limits
