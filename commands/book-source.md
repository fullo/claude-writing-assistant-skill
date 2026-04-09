---
description: Aggiungi e gestisci fonti di riferimento per il libro
allowed-tools: Read, Write, Edit, Glob, Grep, WebFetch, WebSearch, Bash(git:*)
argument-hint: [file-o-url] [descrizione opzionale]
---

Gestisci le fonti di riferimento per il libro corrente. Le fonti vengono salvate nella directory `fonti/` del progetto libro e indicizzate in `fonti/fonti.md`.

## Struttura progetto attesa

```
nome-libro/
├── capitoli/          ← manuscript (LeanPub o altra piattaforma)
├── fonti/             ← fonti di riferimento
│   ├── fonti.md       ← indice fonti
│   ├── documento.pdf
│   └── url-slug.md
├── assets/
└── book-config.md
```

Cercare la directory `fonti/` risalendo dalla directory corrente. Se non trovata, verificare se esiste una directory di progetto libro riconoscibile (con `capitoli/` e/o `book-config.md`).

## Se il primo argomento è un file (PDF, TXT, MD)

1. Verificare che la directory `fonti/` esista. Se non esiste, crearla.
2. Copiare il file in `fonti/`.
3. Leggere il contenuto del file:
   - Per PDF: estrarre il testo e generare un riassunto strutturato
   - Per TXT/MD: leggere il contenuto
4. Aggiungere un'entry in `fonti/fonti.md` con:
   - Nome file
   - Data di aggiunta
   - Descrizione (fornita dall'utente o generata dal contenuto)
   - Temi principali estratti
   - Capitoli potenzialmente rilevanti (se il libro ha già dei capitoli in `capitoli/`)

## Se il primo argomento è un URL

1. Verificare che la directory `fonti/` esista. Se non esiste, crearla.
2. Usare WebFetch per leggere il contenuto della pagina.
3. Salvare un file `fonti/url-[slug].md` con:
   - URL originale
   - Data di accesso
   - Contenuto rilevante estratto (NON copiare integralmente — rispettare copyright)
   - Riassunto dei punti chiave
4. Aggiungere un'entry in `fonti/fonti.md`.

## Se nessun argomento viene fornito

Mostrare l'elenco delle fonti indicizzate in `fonti/fonti.md` con:
- Nome, tipo, data di aggiunta
- Temi principali
- Stato di integrazione (citata nel testo / non ancora usata)

Per verificare lo stato di integrazione, cercare nel testo dei capitoli in `capitoli/` riferimenti a ciascuna fonte.

## Formato di fonti/fonti.md

```markdown
# Fonti di riferimento — [Nome libro]

## [Nome fonte 1]
- **Tipo:** PDF / TXT / URL
- **File:** fonti/nome-file.pdf
- **Data aggiunta:** YYYY-MM-DD
- **Descrizione:** Breve descrizione del contenuto
- **Temi:** tema1, tema2, tema3
- **Capitoli rilevanti:** Cap N, Cap M
- **Stato:** Non ancora integrata / Citata in Cap N

## [Nome fonte 2]
...
```

## Integrazione nel testo

Quando l'utente chiede di integrare una fonte nel testo, leggere prima `book-config.md` per determinare **Lingua** e **Piattaforma** del progetto. Poi leggere la fonte dalla directory `fonti/`, estrarre i concetti rilevanti per il capitolo indicato, e proporre inserimenti che rispettino:
- Il TOV e la lingua del libro (leggere `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/SKILL.md` — la skill caricherà il language pack appropriato)
- L'integrità dei dati (ogni dato numerico tracciabile alla fonte)
- Il formato della piattaforma configurata (se LeanPub/Markua: leggere `${CLAUDE_PLUGIN_ROOT}/skills/markua-leanpub/SKILL.md`; altrimenti: best practice Markdown)
- L'attribuzione esplicita: "secondo [nome organizzazione/studio]"
- Modi di dire ed espressioni idiomatiche naturali della lingua target

## Git commit

Se sono stati aggiunti o modificati file e ci si trova in un repository git (`git rev-parse --is-inside-work-tree 2>/dev/null`), eseguire:

```bash
git add * && git commit -m "book-source: aggiunta fonte [nome fonte o URL slug]"
```

Se non ci si trova in un repository git o non sono stati modificati file (solo consultazione elenco), non fare nulla.
