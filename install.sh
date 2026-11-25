#!/usr/bin/env bash
# Pre-Launch Security Audit Skill Installer
# Author: @initeshjain (https://github.com/initeshjain)
# Repo: https://github.com/initeshjain/pre-launch-security-audit-agent-skill.git

set -e

# Set SKILL_REF to a tag or commit to pin the files this installer downloads (default: main)
SKILL_REF="${SKILL_REF:-main}"
REPO_RAW_URL="https://raw.githubusercontent.com/initeshjain/pre-launch-security-audit-agent-skill/${SKILL_REF}"
TARGET_DIR="${PWD}"
TOOL="${1:-auto}"

echo "============================================================"
echo "🛡️  Pre-Launch Security Audit Skill Installer (v2.0)"
echo "   Author: Nitesh Jain (@initeshjain)"
echo "   GitHub: https://github.com/initeshjain/pre-launch-security-audit-agent-skill"
echo "============================================================"

# Determine file source: local if files exist in same directory, otherwise fetch via curl
fetch_file() {
  local filename="$1"
  local dest="$2"

  if [ -f "${filename}" ]; then
    mkdir -p "$(dirname "$dest")"
    cp "${filename}" "$dest"
  elif [ -f "$(dirname "$0")/${filename}" ]; then
    mkdir -p "$(dirname "$dest")"
    cp "$(dirname "$0")/${filename}" "$dest"
  else
    mkdir -p "$(dirname "$dest")"
    curl -fsSL "${REPO_RAW_URL}/${filename}" -o "$dest"
  fi
}

install_antigravity() {
  echo "📦 Installing for Antigravity (agy)..."
  fetch_file "SKILL.md" "${TARGET_DIR}/.agent/skills/pre-launch-security-audit/SKILL.md"
  echo "✅ Installed to .agent/skills/pre-launch-security-audit/SKILL.md"
}

install_claude() {
  echo "📦 Installing for Claude Code..."
  fetch_file "SKILL.md" "${TARGET_DIR}/.claude/skills/pre-launch-security-audit/SKILL.md"
  if [ ! -f "${TARGET_DIR}/CLAUDE.md" ]; then
    fetch_file "CLAUDE.md" "${TARGET_DIR}/CLAUDE.md"
    echo "✅ Created CLAUDE.md"
  else
    echo "ℹ️  CLAUDE.md already exists; keeping existing file."
  fi
  echo "✅ Installed to .claude/skills/pre-launch-security-audit/SKILL.md"
}

install_cursor() {
  echo "📦 Installing for Cursor..."
  fetch_file ".cursor/rules/pre-launch-security-audit.mdc" "${TARGET_DIR}/.cursor/rules/pre-launch-security-audit.mdc"
  if [ ! -f "${TARGET_DIR}/.cursorrules" ]; then
    fetch_file ".cursorrules" "${TARGET_DIR}/.cursorrules"
    echo "✅ Created .cursorrules"
  else
    echo "ℹ️  .cursorrules already exists; keeping existing file."
  fi
  echo "✅ Installed to .cursor/rules/pre-launch-security-audit.mdc"
}

install_copilot() {
  echo "📦 Installing for GitHub Copilot..."
  fetch_file ".github/copilot-instructions.md" "${TARGET_DIR}/.github/copilot-instructions.md"
  echo "✅ Installed to .github/copilot-instructions.md"
}

install_root_skill() {
  echo "📦 Installing root SKILL.md and templates..."
  fetch_file "SKILL.md" "${TARGET_DIR}/SKILL.md"
  fetch_file "templates/AUDIT_TEMPLATE.md" "${TARGET_DIR}/templates/AUDIT_TEMPLATE.md"
  fetch_file "templates/AGENT_PROMPT.md" "${TARGET_DIR}/templates/AGENT_PROMPT.md"
  echo "✅ Installed SKILL.md and template guides."
}

ensure_gitignore() {
  if [ -f "${TARGET_DIR}/.gitignore" ]; then
    if ! grep -q "AUDIT.md" "${TARGET_DIR}/.gitignore"; then
      echo "" >> "${TARGET_DIR}/.gitignore"
      echo "# Pre-launch security audit findings (contains sensitive vulnerability data)" >> "${TARGET_DIR}/.gitignore"
      echo "AUDIT.md" >> "${TARGET_DIR}/.gitignore"
      echo "✅ Added AUDIT.md to .gitignore"
    fi
  else
    echo "# Pre-launch security audit findings (contains sensitive vulnerability data)" > "${TARGET_DIR}/.gitignore"
    echo "AUDIT.md" >> "${TARGET_DIR}/.gitignore"
    echo "✅ Created .gitignore with AUDIT.md"
  fi
}

case "$TOOL" in
  antigravity)
    install_antigravity
    install_root_skill
    ;;
  claude)
    install_claude
    install_root_skill
    ;;
  cursor)
    install_cursor
    install_root_skill
    ;;
  copilot)
    install_copilot
    install_root_skill
    ;;
  all|auto)
    install_antigravity
    install_claude
    install_cursor
    install_copilot
    install_root_skill
    ;;
  *)
    echo "Usage: ./install.sh [all|antigravity|claude|cursor|copilot]"
    exit 1
    ;;
esac

ensure_gitignore

echo ""
echo "🎉 Installation completed successfully!"
echo "👉 To run the audit, prompt your agent:"
echo "   'Audit this project before launch' or 'Run pre-launch security audit'"
echo ""
echo "⭐ Give a star on GitHub: https://github.com/initeshjain/pre-launch-security-audit-agent-skill"
