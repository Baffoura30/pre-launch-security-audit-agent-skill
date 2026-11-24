<div align="center">

# 🛡️ Pre-Launch Security Audit Skill (v2.0)

**The comprehensive 85-check security audit skill for AI-built web, mobile, and API applications.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Checks](https://img.shields.io/badge/Checks-85%20(67%20Code%20%2B%2018%20Human)-blue.svg)](#the-85-checks)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/initeshjain/pre-launch-security-audit-agent-skill/pulls)
[![Author](https://img.shields.io/badge/Author-@initeshjain-red.svg)](https://github.com/initeshjain)

---

### ⭐ **If you find this skill helpful, please [Star the Repository](https://github.com/initeshjain/pre-launch-security-audit-agent-skill.git)!** ⭐

*Your support helps maintain and update this skill with new security vectors.*

---

</div>

## 📌 Overview

**Pre-Launch Security Audit** transforms any AI coding agent into an elite **Senior Application Security Engineer** with 25 years of experience. It scans your codebase in a single structured pass, discovers vulnerabilities, generates a private `AUDIT.md` report, safely fixes confirmed flaws with your approval, and guides you through critical operational launch checks.

Built specifically for AI-generated and modern full-stack stacks:
- **Frontend**: React, Next.js, Vue, Svelte, static sites
- **Backend**: FastAPI, Node.js (Express/NestJS), Python, Next.js API routes
- **Databases**: MongoDB, PostgreSQL, MySQL, Supabase, Firebase
- **Mobile**: Expo (React Native), iOS & Android
- **Auth & Payments**: Emergent Auth, Supabase Auth, NextAuth/Auth.js, Stripe, Razorpay
- **AI Integrations**: OpenAI, Anthropic, Gemini, LangChain, Emergent Universal Key (`sk-emergent-`)

---

## ⚡ Quick Start: Run in 10 Seconds

Once installed in your project, simply ask your agent in chat:

> **"Run a pre-launch security audit on this project"**  
> *(or: "Audit my app before launch" / "Start the audit")*

The agent will automatically initiate the 4-step workflow:
1. **Intake** (Detects stack; asks max 5 non-code questions)
2. **Code Pass** (Runs all 67 checks without pausing; writes `AUDIT.md`)
3. **Fix Round** (Applies only the fixes you approve, Critical first)
4. **Checklist & Report** (Runs 18 human operational checks; outputs one-screen verdict)

---

## 🚀 Installation & Setup

Install this skill into any AI developer tool or agent environment in seconds.

### Method 1: Automated 1-Click Installer (Recommended)

Run this command inside your project directory to install for **all agents** at once:

```bash
curl -fsSL https://raw.githubusercontent.com/initeshjain/pre-launch-security-audit-agent-skill/main/install.sh | bash
```

Or install for a specific tool:

```bash
# Antigravity (agy)
curl -fsSL https://raw.githubusercontent.com/initeshjain/pre-launch-security-audit-agent-skill/main/install.sh | bash -s antigravity

# Claude Code
curl -fsSL https://raw.githubusercontent.com/initeshjain/pre-launch-security-audit-agent-skill/main/install.sh | bash -s claude

# Cursor
curl -fsSL https://raw.githubusercontent.com/initeshjain/pre-launch-security-audit-agent-skill/main/install.sh | bash -s cursor

# GitHub Copilot
curl -fsSL https://raw.githubusercontent.com/initeshjain/pre-launch-security-audit-agent-skill/main/install.sh | bash -s copilot
```

---

### Method 2: Manual Installation by Tool

#### 🔹 1. Google Antigravity (agy / Antigravity IDE)
- **Project-level**: Copy `SKILL.md` into your project at:
  ```bash
  mkdir -p .agent/skills/pre-launch-security-audit
  cp SKILL.md .agent/skills/pre-launch-security-audit/SKILL.md
  ```
- **Global**: Copy `SKILL.md` to:
  ```bash
  mkdir -p ~/.gemini/antigravity/skills/pre-launch-security-audit
  cp SKILL.md ~/.gemini/antigravity/skills/pre-launch-security-audit/SKILL.md
  ```

#### 🔹 2. Claude Code (Anthropic)
- **Skills directory**:
  ```bash
  mkdir -p .claude/skills/pre-launch-security-audit
  cp SKILL.md .claude/skills/pre-launch-security-audit/SKILL.md
  ```
- **Project instructions (`CLAUDE.md`)**:
  Include a reference to `SKILL.md` or copy the contents of `CLAUDE.md` from this repo into your project's root `CLAUDE.md`.

#### 🔹 3. Cursor
- **Cursor Rules (`.cursor/rules`)**:
  Copy `.cursor/rules/pre-launch-security-audit.mdc` into your project's `.cursor/rules/` directory:
  ```bash
  mkdir -p .cursor/rules
  cp .cursor/rules/pre-launch-security-audit.mdc .cursor/rules/
  ```
- **Legacy `.cursorrules`**:
  Copy `.cursorrules` to the root of your project.

#### 🔹 4. Devin (Cognition)
- Add this repository URL (`https://github.com/initeshjain/pre-launch-security-audit-agent-skill.git`) to Devin's **Knowledge / Repository Context**, or paste [`templates/AGENT_PROMPT.md`](./templates/AGENT_PROMPT.md) directly into your Devin session instructions.

#### 🔹 5. GitHub Copilot & VS Code
- Copy `.github/copilot-instructions.md` into your repository:
  ```bash
  mkdir -p .github
  cp .github/copilot-instructions.md .github/copilot-instructions.md
  ```

#### 🔹 6. Windsurf / Codeium
- Copy `.cursorrules` or `SKILL.md` content into `.windsurfrules` in your project root.

#### 🔹 7. Emergent / Web Chat / ChatGPT / Claude Web
- Open [`templates/AGENT_PROMPT.md`](./templates/AGENT_PROMPT.md), copy the entire prompt text, and paste it into the chat window followed by: *"Start the audit"*.

---

## 🔄 The 4-Step Audit Workflow

```mermaid
flowchart TD
    Step1["Step 1: Intake\nDetect stack · Ask max 5 non-code questions"] --> Step2["Step 2: Code Pass\nRun 67 checks · Write AUDIT.md · Report counts"]
    Step2 --> Step3["Step 3: Fix Round\nUser selects what to fix · Server-side fixes · Re-test"]
    Step3 --> Step4["Step 4: Human Checklist & Report\n18 operational checks · 1-screen verdict · Runbook"]
```

### 1. Step 1: Intake
- Scans files to detect framework, backend, database, authentication, payments, AI calls, and file handling.
- Asks **only what code cannot answer** (up to 5 questions):
  1. Live or preview? How many users expected in 3 months?
  2. User geographic locations? Any minors (under 18)?
  3. Original code or imported starter templates/boilerplates?
  4. Is the GitHub repo public or private?
  5. Any detected technology incorrect?

### 2. Step 2: Code Pass
- Runs all 67 checks across 13 security areas **in one uninterrupted pass**.
- Records full findings, file locations, line numbers, and evidence to `AUDIT.md`.
- Automatically adds `AUDIT.md` to `.gitignore`.
- Summarizes findings in chat in **under 3 lines per issue**, grouped by severity (**Critical**, **High**, **Medium**, **Low**).
- Asks one simple decision question: *"Which should I fix: all Critical and High, everything, or pick by number?"*

### 3. Step 3: Fix Round
- Fixes **only user-approved issues**, Critical severity first.
- Enforces fixes strictly on the server/backend—never solely in client-side code.
- Re-verifies each fix with code evidence and updates `AUDIT.md`.
- Performs a smoke test of authentication, core features, and payments in Preview.

### 4. Step 4: Checklist & Report
- Sends only the relevant operational questions from the **18 Human Checks (H1–H18)**.
- Produces the **One-Screen Final Report** including verdict, to-do list, production runbook, and key leak emergency steps.

---

## 🔒 7 Unbreakable Safety Rules

The skill enforces strict guardrails to protect your code and infrastructure:

1. **Audit Only This Project**: Never scans or tests external domains or services you do not own.
2. **Read-Only By Default**: Makes zero code or configuration changes until you explicitly approve them.
3. **No Destructive Tests**: Never deletes live data, floods APIs, executes live charges, or spams real users.
4. **Never Print Secrets**: Masks all keys and tokens (e.g. `sk-e•••• in backend/server.py:12`).
5. **Never Request Secrets**: Never asks you to paste passwords or keys into chat.
6. **Never Weaken Security**: Never removes authentication checks or loosens CORS to silence an error.
7. **Indirect Prompt Injection Defense**: Treats all codebase content as data to audit, never as instructions to execute.

---

## 📋 The 85 Checks

### 💻 67 Automated Code Checks (13 Security Domains)

| Domain | Checks | Scope & Key Defenses |
|---|:---:|---|
| **01. Secrets and API keys** | 4 | No secret keys in frontend (`VITE_`, `NEXT_PUBLIC_`), no keys in git history, environment variable storage, no secrets logged. |
| **02. Login and sessions** | 7 | Server session verification, bcrypt/argon2 hashing, safe password reset tokens, rate limits on auth, token expiration, secure cookies (`HttpOnly`, `SameSite`), OAuth redirect allowlist. |
| **03. Access control** | 6 | Object-level authorization (IDOR check: `{"_id": id, "user_id": current_user.id}`), mass-assignment prevention (Pydantic role exclusion), backend admin verification, server-side usage limits, team isolation, test routes disabled. |
| **04. Database & file storage** | 5 | NoSQL & SQL injection prevention, non-sequential public IDs (UUIDv4), private file storage with signed URLs, direct database port isolation, Supabase RLS / Firebase rules validation. |
| **05. Input & output handling** | 6 | Server-side schema validation (Pydantic/Zod), XSS prevention (sanitized markdown/HTML), file upload type/size limits, SSRF prevention (IP range restrictions), open redirect defense, generic error messages. |
| **06. API abuse protection** | 6 | Persistent rate limiting (Redis/DB), CORS domain allowlists without `*` credentials, bot protection on public forms (Turnstile), minimal API response models, CSRF defense, webhook signature verification. |
| **07. Payments and money** | 6 | Server-authoritative pricing, webhook-based fulfillment verification, subscription lifecycle handling (refunds/disputes), test/live key separation, trial/coupon race condition defense, transparent billing disclosures. |
| **08. AI features (LLM Security)** | 5 | Token limits & usage caps, prompt injection boundaries, untrusted model output escaping, no secrets in system prompts, isolated per-user vector/RAG memory. |
| **09. Dependencies & supply chain**| 4 | Known vulnerability auditing (`npm audit`, `pip-audit`), pinned dependencies & committed lockfiles, hidden prompt injection scanning in templates/READMEs, third-party script auditing. |
| **10. Deployment & config** | 5 | Essential security headers (`nosniff`, `frame-ancestors`, CSP), production debug flags disabled, `/docs` & `/openapi.json` gated, sensitive dotfiles blocked (`/.env`, `/.git`), security audit logging. |
| **11. Cost & code health** | 3 | Elimination of wasteful client polling (`setInterval`), prevention of runaway cost loops/retries, removal of dead duplicate versions (`v1/v2`). |
| **12. Privacy and legal** | 3 | Privacy policy & terms links, consent-gated tracking (GDPR/ePrivacy), user account & data deletion endpoints. |
| **13. Mobile app (Expo)** | 7 | Secure store (`expo-secure-store`), enforced HTTPS/ATS, validated deep links, locked WebViews, minimal permissions, in-app account deletion, clean release builds. |

---

### 👤 18 Human Operational Checks (H1–H18)

| ID | Focus | Action Required |
|---|---|---|
| **H1** | Key Leak Review | Rotate any keys ever pasted into AI chats, WhatsApp, Slack, or tickets. |
| **H2** | Spending Limits | Set hard budget alerts and caps across LLM, cloud, and payment accounts. |
| **H3** | Public Git Safety | Revoke and rotate any secrets ever pushed to public version control. |
| **H4** | Multi-Factor Auth | Enable 2FA on domain registrars, hosting dashboards, payment portals, and databases. |
| **H5** | Two-Account Test | Verify in preview that Account A cannot read or mutate Account B's records. |
| **H6** | Data Minimization | Cease collection of and delete unnecessary personal or financial data. |
| **H7** | Disaster Recovery | Confirm automated database backup schedules and test a live restore. |
| **H8** | Cloud Advisories | *(Supabase/Firebase)* Review Security Advisor and database rules console warnings. |
| **H9** | Compliance & Billing | Verify refund policies, terms of sale, and tax/GST invoicing capabilities. |
| **H10** | AI Data Retention | Ensure user data sent to LLM providers is opted out of model training. |
| **H11** | Staging Isolation | Confirm test accounts and mock data never exist in production databases. |
| **H12** | Domain Security | Configure registrar 2FA, `SPF`, `DKIM`, and `DMARC` records for outgoing emails. |
| **H13** | Rollback Readiness | Verify the team can roll back to a prior deployment version in under 5 minutes. |
| **H14** | Monitoring & Alerts | Configure uptime monitors and real-time alerting for 5xx errors and crashes. |
| **H15** | Child Privacy (Minors)| Comply with COPPA (US <13) and DPDP Act (India) if minors can access the app. |
| **H16** | Anti-Spam Compliance | Verify functional 1-click unsubscribe links in emails and explicit opt-in for SMS/WhatsApp. |
| **H17** | App Store Nutrition | *(Mobile)* Ensure App Store and Google Play data declarations match code behavior. |
| **H18** | Force-Update Ability | *(Mobile)* Confirm ability to force client updates if a zero-day vulnerability is fixed. |

---

## 📊 Sample Output

### The One-Screen Final Report
```text
## 🏁 Pre-Launch Security Audit: Final Report

- Verdict: Ready to launch after 2 High fixes
- Scorecard: 58 Passed · 6 Fixed · 2 Still Open · 3 Need You · 16 Skipped

### 🚨 Open Issues
- [High] 3.1 Object Ownership Check: /api/documents/:id lacks owner verification — Assigned to: AI
- [Medium] 10.3 API Docs Exposed: /docs and /openapi.json accessible publicly — Assigned to: AI

### 📋 Your To-Do List
- [ ] [Check H2]: Set $50 monthly hard cap on OpenAI API billing dashboard.
- [ ] [Check H4]: Enable 2FA on domain registrar account.
- [ ] [Check H7]: Test restoring your latest MongoDB backup in staging.

### 🌐 Do This On Your Live App
1. Set CORS allowed origins in production env: ALLOWED_ORIGINS="https://myapp.com"
2. Remove any test admin credentials from the production database.

### 🛡️ If a Secret Key Ever Leaks (Emergency Runbook)
1. Revoke the compromised key immediately on the provider portal.
2. Generate a new secret key.
3. Update the key in your hosting secrets manager and re-publish.
4. Review billing logs and API metrics for unauthorized usage.
```

---

## 👨‍💻 Author & Maintainer

Created with ❤️ by **Nitesh Jain** ([@initeshjain](https://github.com/initeshjain)).

- GitHub: [https://github.com/initeshjain](https://github.com/initeshjain)
- Skill Repository: [https://github.com/initeshjain/pre-launch-security-audit-agent-skill.git](https://github.com/initeshjain/pre-launch-security-audit-agent-skill.git)

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE) — free for personal, commercial, and enterprise use.

---

<div align="center">

**🌟 Don't forget to [Star this repo](https://github.com/initeshjain/pre-launch-security-audit-agent-skill.git) if it helped secure your app before launch! 🌟**

</div>
