---
description: Valida il formato Markua di un file o dell'intero libro
allowed-tools: Read, Grep, Glob, Write, Edit, Bash(git:*)
argument-hint: [file.md o directory manuscript/]
---

Valida il formato Markua del file o della directory indicata in $ARGUMENTS.

**Prerequisito piattaforma:** leggere `book-config.md` nella root del progetto. Se il campo `Piattaforma` è diverso da `LeanPub (Markua)`, informare l'utente: "Questo comando è specifico per il formato Markua/LeanPub. Il progetto usa [piattaforma]. Le regole Markua non si applicano." Se `book-config.md` non esiste o non specifica la piattaforma, procedere con la validazione Markua (default).

Prima leggere: `${CLAUDE_PLUGIN_ROOT}/skills/markua-leanpub/SKILL.md` e `${CLAUDE_PLUGIN_ROOT}/skills/markua-leanpub/references/markua-rules.md`.

Se $ARGUMENTS è un singolo file .md, validare quel file.
Se $ARGUMENTS è una directory di progetto libro o non specificato, cercare `book.txt` in `capitoli/` (o nella directory corrente), leggere l'elenco dei capitoli e validarli tutti.

Struttura attesa: `nome-libro/capitoli/book.txt` + file .md nella stessa directory.

Per ogni file, controllare:

1. **Titolo** — H1 unico con formato `# Capitolo N: Titolo — Sottotitolo`
2. **Epigrafe** — virgolette senza corsivo, attribuzione su singola riga con `— **Autore**`
3. **Separatore** — `---` presente dopo epigrafe
4. **Sezioni** — `## N.M Titolo — Sottotitolo` con trattino lungo (—), mai corto (-)
5. **Pagebreak** — `{pagebreak}` prima di ogni `##` (tranne la prima)
6. **Callout T>** — label ammesse: `**Insight**`, `**Regola pratica**`, `**Approfondimento**`. No emoji, no sottotitoli nella label
7. **Callout W>** — label `**Red Flag**` con F maiuscola. No varianti
8. **Callout Q>** — label `**Domanda Socratica**` senza emoji
9. **Quick Win** — in `{blurb, icon: trophy}`, label bold (non H2), chiuso con `{/blurb}`
10. **Checkpoint** — `## Checkpoint capitolo N`, sotto-sezioni `###` con ≥3 checkbox
11. **Fine Parte** — `## Fine Parte N — Nome` (H2, non bold)
12. **Emoji** — zero emoji in callout, titoli, label
13. **Sentence case** — tutti i titoli
14. **Tabelle** — formato Markdown standard con allineamento

Output per ogni file:

```
FILE: nome-file.md
  ✅ Titolo: conforme
  ❌ Epigrafe: corsivo presente, rimuovere *"..."*
  ⚠️ Pagebreak: mancante prima di ## 3.4
  ...

RIEPILOGO: X errori, Y avvertimenti su Z file analizzati
```

Se si tratta di validazione multi-file, compilare anche la matrice di distribuzione callout (come in `references/markua-rules.md`).

## Git commit

Se sono stati applicati fix al formato e ci si trova in un repository git (`git rev-parse --is-inside-work-tree 2>/dev/null`), eseguire:

```bash
git add * && git commit -m "book-markua: fix [N] errori formato in [file/i modificati]"
```

Se non ci si trova in un repository git o non sono stati applicati fix (solo analisi), non fare nulla.
