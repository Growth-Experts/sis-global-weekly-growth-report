#!/bin/bash
# Export a weekly report to PDF (one 960x540 slide per page) via headless Chrome.
# Usage: npm run pdf -- sis-global-weekly-growth-report-21-september-2026.html
#        npm run pdf            (no argument = newest weekly report)
set -euo pipefail
cd "$(dirname "$0")/.."

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
HTML="${1:-$(ls -t sis-global-weekly-growth-report-*.html | head -1)}"
OUT="pdf/$(basename "$HTML" .html).pdf"

mkdir -p pdf
"$CHROME" --headless --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=5000 \
  --print-to-pdf="$OUT" "file://$PWD/$HTML" 2>/dev/null

echo "Saved $OUT"
