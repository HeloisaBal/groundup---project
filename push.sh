#!/bin/bash
# Quick commit + push script for groundup---project
# Usage: ./push.sh "your commit message"
# If no message is provided, a timestamped message is used.

set -e

cd "$(dirname "$0")"

# Use provided message, or default to a timestamp
MSG="${1:-update $(date '+%Y-%m-%d %H:%M')}"

# Check for changes
if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing to commit — working tree is clean."
  exit 0
fi

echo "Staging all changes..."
git add -A

echo "Committing: $MSG"
git commit -m "$MSG"

echo "Pushing to GitHub..."
git push

echo ""
echo "Done! Vercel should redeploy shortly."
echo "Check: https://groundup-project.vercel.app/"
