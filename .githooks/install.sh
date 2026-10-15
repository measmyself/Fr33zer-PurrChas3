#!/bin/bash
# Point this clone's git at the versioned hooks in .githooks/.
# Run once per clone:  ./.githooks/install.sh
#
# Why this is needed at all: git only runs hooks from core.hooksPath (or the
# unversioned .git/hooks/). Committing a hook does not arm it. A clone with no
# hooksPath set has NO copy gate, which is the exact defect this port fixes --
# so the install step is part of the gate, not a convenience.
set -euo pipefail
cd "$(dirname "$0")/.."
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit
echo "copy gate armed: core.hooksPath = $(git config core.hooksPath)"
echo "verify with: git config --get core.hooksPath && ls -l .githooks/pre-commit"
