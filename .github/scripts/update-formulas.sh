#!/usr/bin/env bash
#
# Bumps every formula of the tap whose project has a newer release tag, then
# builds it from source, tests and audits it. Leaves the changes uncommitted
# and prints one "formula version" line per bump.
#
# Usage: update-formulas.sh [tap]      (default: byjg/tap)
#
set -euo pipefail

tap="${1:-byjg/tap}"

# `brew livecheck` checks each formula's GitHub tags by default.
outdated=$(brew livecheck --tap "$tap" --formula --newer-only --json |
  jq -r '.[] | select(.version.outdated) | "\(.formula) \(.version.latest)"')

while read -r formula version; do
  [[ -n "$formula" ]] || continue
  name="${formula##*/}"
  echo "::group::$name $version" >&2
  # Rewrites url and sha256 in the formula for the new version.
  brew bump-formula-pr --write-only --no-audit --version="$version" "$tap/$name" >&2
  brew install --build-from-source "$tap/$name" >&2
  brew test "$tap/$name" >&2
  brew audit --strict --online --formula "$tap/$name" >&2
  echo "::endgroup::" >&2
  echo "$name $version"
done <<<"$outdated"
