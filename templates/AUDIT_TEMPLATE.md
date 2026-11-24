# AUDIT.md Template

Use this format when generating or tracking security audit findings for a project.

---

```markdown
# AUDIT.md

**Scope**: [Stack, product type, skipped areas and reasons]  
**Summary**: X passed · Y failed · Z need user · W skipped  

## Findings

### [1.1] No secret keys in frontend or app code
- **Status**: FAIL
- **Severity**: Critical
- **Evidence**: `client/src/config.ts:14` (`sk-e••••`) · Confirmed
- **Checked**: All client bundles, public environment variables (`VITE_*`, `NEXT_PUBLIC_*`)
- **Risk**: Anyone inspecting the client bundle can extract the key and incur unauthorized LLM/API charges.
- **Fix**: Move the LLM call to a backend API proxy route and remove the client-side environment variable.  
  *Status after fix*: Fixed & verified

### [2.1] Every private route verifies session on server
- **Status**: PASS
- **Checked**: `/api/users/me`, `/api/projects`, `/api/billing`, `/api/settings`
- **Evidence**: All endpoints enforce `get_current_user` FastAPI dependency.

### [3.1] Every record checks ownership
- **Status**: FAIL
- **Severity**: High
- **Evidence**: `server/routes/documents.py:45` · Confirmed
- **Checked**: All CRUD routes for documents, user profiles, invoices
- **Risk**: An attacker can supply another user's document ID and read or delete their private files (IDOR).
- **Fix**: Add `owner_id=current_user.id` filter to document retrieval queries.  
  *Status after fix*: Pending user approval

... (Repeat for all checked areas)
```
