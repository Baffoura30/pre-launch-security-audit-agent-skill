# GitHub Copilot Instructions: Pre-Launch Security Audit

When requested to conduct a security review or pre-launch audit:
1. Follow the **Pre-Launch Security Audit (v2.0)** specifications in `SKILL.md`.
2. Follow the 4-step framework:
   - Step 1: Detect the product stack and ask up to 5 non-code questions.
   - Step 2: Perform the 67 automated checks across secrets, authentication, access control, database security, input/output validation, API abuse, payments, AI integration, supply chain, server deployment, cost health, privacy, and mobile security.
   - Step 3: Propose precise server-side fixes only for approved issues.
   - Step 4: Validate human operational controls (H1-H18) and present the final report.
3. Obey all safety rules: mask secrets (`sk-e••••`), never weaken security, and keep `AUDIT.md` out of git tracking.
