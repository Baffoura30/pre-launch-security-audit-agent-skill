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

# When run from a file (not piped from curl), local copies come from the
# folder holding this script, never from the project being installed into.
SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

# Copy from SCRIPT_DIR when the file is there, otherwise download it.
fetch_file() {
  local filename="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  if [ -n "$SCRIPT_DIR" ] && [ -f "${SCRIPT_DIR}/${filename}" ]; then
    # Installing into the repo itself: the file is already in place.
    if [ "${SCRIPT_DIR}/${filename}" -ef "$dest" ]; then
      return 0
    fi
    cp "${SCRIPT_DIR}/${filename}" "$dest"
  else
    curl -fsSL "${REPO_RAW_URL}/${filename}" -o "$dest"
  fi
}

# Like fetch_file, but keeps a file the project already has (for shared
# paths such as .github/copilot-instructions.md or a root SKILL.md).
fetch_file_keep() {
  local filename="$1"
  local dest="$2"

  if [ -e "$dest" ] && ! { [ -n "$SCRIPT_DIR" ] && [ "${SCRIPT_DIR}/${filename}" -ef "$dest" ]; }; then
    echo "ℹ️  ${dest#"${TARGET_DIR}"/} already exists; keeping existing file."
    return 0
  fi
  fetch_file "$filename" "$dest"
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
  if [ -e "${TARGET_DIR}/.github/copilot-instructions.md" ] && ! { [ -n "$SCRIPT_DIR" ] && [ "${SCRIPT_DIR}/.github/copilot-instructions.md" -ef "${TARGET_DIR}/.github/copilot-instructions.md" ]; }; then
    echo "ℹ️  .github/copilot-instructions.md already exists; keeping existing file."
  else
    fetch_file ".github/copilot-instructions.md" "${TARGET_DIR}/.github/copilot-instructions.md"
    echo "✅ Installed to .github/copilot-instructions.md"
  fi
}

install_root_skill() {
  echo "📦 Installing root SKILL.md and templates..."
  fetch_file_keep "SKILL.md" "${TARGET_DIR}/SKILL.md"
  fetch_file_keep "templates/AUDIT_TEMPLATE.md" "${TARGET_DIR}/templates/AUDIT_TEMPLATE.md"
  fetch_file_keep "templates/AGENT_PROMPT.md" "${TARGET_DIR}/templates/AGENT_PROMPT.md"
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
