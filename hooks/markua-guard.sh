#!/bin/bash
# markua-guard.sh — Pre-filter for Write/Edit hook
# Exits silently (code 0) if the file is NOT a Markua/manuscript file,
# avoiding unnecessary LLM prompt evaluation on non-book projects.
#
# Also exits silently if the book project uses a non-Markua platform.
#
# When the file IS relevant, outputs validation instructions for the LLM.

# The tool input is passed via stdin as JSON
INPUT=$(cat)

# Extract file_path from the JSON input
FILE_PATH=$(echo "$INPUT" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')

# If we couldn't extract a path, approve silently
if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Check 1: Is this a .md file?
if [[ "$FILE_PATH" != *.md ]]; then
  exit 0
fi

# Check 2: Is this inside a manuscript/ directory?
IS_MANUSCRIPT=false
if echo "$FILE_PATH" | grep -q "/manuscript/"; then
  IS_MANUSCRIPT=true
fi

# Check 3: Is there a Book.txt or book-config.md in the project?
# Walk up from the file to find project root indicators
DIR=$(dirname "$FILE_PATH")
HAS_BOOK_MARKER=false
BOOK_CONFIG_PATH=""
while [ "$DIR" != "/" ] && [ "$DIR" != "." ]; do
  if [ -f "$DIR/Book.txt" ] || [ -f "$DIR/book-config.md" ] || [ -f "$DIR/manuscript/Book.txt" ]; then
    HAS_BOOK_MARKER=true
    if [ -f "$DIR/book-config.md" ]; then
      BOOK_CONFIG_PATH="$DIR/book-config.md"
    fi
    break
  fi
  DIR=$(dirname "$DIR")
done

# If neither in manuscript/ nor in a book project, approve silently
if [ "$IS_MANUSCRIPT" = false ] && [ "$HAS_BOOK_MARKER" = false ]; then
  exit 0
fi

# Check 4: If book-config.md exists, verify the platform is LeanPub/Markua
if [ -n "$BOOK_CONFIG_PATH" ]; then
  PLATFORM=$(grep -i "Piattaforma:" "$BOOK_CONFIG_PATH" 2>/dev/null | head -1)
  if [ -n "$PLATFORM" ]; then
    if ! echo "$PLATFORM" | grep -qi "markua\|leanpub"; then
      # Platform is not Markua/LeanPub — skip Markua validation
      exit 0
    fi
  fi
  # If Piattaforma not found, default to Markua validation
fi

# File is relevant — output validation instructions for the LLM
# Read book language from config if available
LANG_LINE=""
if [ -n "$BOOK_CONFIG_PATH" ]; then
  LANG_LINE=$(grep -i "Lingua:" "$BOOK_CONFIG_PATH" 2>/dev/null | head -1)
fi

cat <<'PROMPT'
This file is part of a Markua/LeanPub book project. Quick validation:

1. Callouts use canonical labels: T> **Insight** / **Regola pratica** / **Approfondimento**, W> **Red Flag** (capital F), Q> **Domanda Socratica**
2. No emoji in labels or titles
3. Titles use sentence case
4. Dashes in titles/subtitles are em-dashes (—) not en-dashes (-)
5. Quick Win uses {blurb, icon: trophy} with bold label (not ##)

Note: read book-config.md for the book's language and respond accordingly.
If violations found, briefly flag what to fix before proceeding.
PROMPT
