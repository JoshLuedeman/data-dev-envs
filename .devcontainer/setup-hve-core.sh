#!/usr/bin/env bash
# .devcontainer/setup-hve-core.sh
# Best-effort, non-fatal, idempotent install of the hve-core-all Copilot CLI plugin.
# The sandbox/dev-container starts even if any step below fails.
set -euo pipefail

echo "==> Checking for Copilot CLI..."
if ! command -v copilot >/dev/null 2>&1; then
  echo "==> Installing @github/copilot CLI..."
  npm install -g @github/copilot || echo "::warning::copilot CLI install failed"
fi

echo "==> Adding hve-core marketplace entry..."
copilot plugin marketplace add microsoft/hve-core || echo "::warning::marketplace add failed"

echo "==> Installing hve-core-all plugin..."
copilot plugin install hve-core-all@hve-core || echo "::warning::hve-core-all install failed"

echo "==> Installed Copilot plugins:"
copilot plugin list || true