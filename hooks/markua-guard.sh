#!/bin/bash
# markua-guard.sh — Pre-filter for Write/Edit hook
# Exits silently (code 0) if the file is NOT a Markua/manuscript file,
# avoiding unnecessary LLM prompt evaluation on non-book projects.
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
while [ "$DIR" != "/" ] && [ "$DIR" != "." ]; do
  if [ -f "$DIR/Book.txt" ] || [ -f "$DIR/book-config.md" ] || [ -f "$DIR/manuscript/Book.txt" ]; then
    HAS_BOOK_MARKER=true
    break
  fi
  DIR=$(dirname "$DIR")
done

# If neither in manuscript/ nor in a book project, approve silently
if [ "$IS_MANUSCRIPT" = false ] && [ "$HAS_BOOK_MARKER" = false ]; then
  exit 0
fi

# File is relevant — output validation instructions for the LLM
cat <<'PROMPT'
Questo file è parte di un progetto libro Markua/LeanPub. Verifica rapidamente:

1. I callout usano le label canoniche: T> **Insight** / **Regola pratica** / **Approfondimento**, W> **Red Flag** (F maiuscola), Q> **Domanda Socratica**
2. Nessuna emoji nelle label o nei titoli
3. I titoli sono in sentence case
4. I trattini nei titoli/sottotitoli sono trattini lunghi (—) non corti (-)
5. I Quick Win sono in {blurb, icon: trophy} con label bold (non ##)

Se trovi violazioni, segnala brevemente cosa correggere prima di procedere.
PROMPT
