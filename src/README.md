# Book Writing Assistant

Assistente editoriale per la serie **"the Right Way"** di Francesco Fullone (Daruma Consulting). Gestisce TOV, grammatica italiana, formato Markua/LeanPub, coerenza narrativa e fonti di riferimento.

## Componenti

### Skills (conoscenza di dominio)

| Skill | Scopo |
| :--- | :--- |
| **tov-style** | Tono di voce conversazionale-esperto, stile narrativo, 15 regole di validazione italiano, scorecard di qualità |
| **markua-leanpub** | Formato Markua canonico per LeanPub: callout, pagebreak, blurb, checkpoint, epigrafi |
| **book-coherence** | Coerenza intra-libro (timeline, numeri, personaggi, cross-reference) e inter-libro (terminologia, casi studio condivisi) |

### Commands (azioni utente)

Tutti i comandi usano il prefisso `/book-` per facile individuazione.

| Comando | Scopo |
| :--- | :--- |
| `/book-init [nome]` | Scaffolda la struttura completa di un nuovo libro |
| `/book-review [file.md]` | Revisione editoriale completa: scorecard + grammatica + Markua + contenuto |
| `/book-markua [file o dir]` | Validazione formato Markua su singolo file o intero libro |
| `/book-coherence [dir1] [dir2]` | Verifica coerenza intra-libro o inter-libro |
| `/book-status [dir]` | Panoramica stato del libro, genera `stato-libro.md` automaticamente |
| `/book-source [file-o-url]` | Aggiunge e indicizza fonti di riferimento (PDF, TXT, URL) |

### Agent

| Agente | Scopo |
| :--- | :--- |
| **book-reviewer** | Revisore completo che orchestra tutti i controlli per audit approfonditi |

### Hook

| Evento | Scopo |
| :--- | :--- |
| **PreToolUse** (Write/Edit) | Validazione automatica Markua prima di ogni scrittura su file .md |

## Struttura progetto

```
libri/
├── nome-libro-1/
│   ├── capitoli/              ← manuscript LeanPub
│   │   ├── book.txt           ← elenco capitoli in ordine
│   │   ├── ch01-introduzione.md
│   │   ├── ch02-hook.md
│   │   ├── ...
│   │   └── appendice-a.md
│   ├── fonti/                 ← fonti di riferimento
│   │   ├── fonti.md           ← indice fonti (gestito da /book-source)
│   │   ├── documento.pdf
│   │   └── url-slug.md
│   ├── assets/                ← materiale di supporto
│   │   ├── images/            ← immagini, screenshot
│   │   ├── exercises/         ← JSON esercizi, carte
│   │   └── templates/         ← template, canvas, Miro
│   ├── book-config.md         ← metadati: framework, personaggi, timeline, terminologia
│   └── stato-libro.md         ← generato automaticamente da /book-status
├── nome-libro-2/
│   └── ...
```

La directory `capitoli/` corrisponde alla `manuscript/` di LeanPub e contiene `book.txt` insieme a tutti i file .md del libro.

Il file `book-config.md` contiene i metadati strutturati del libro (framework centrale, personaggi, timeline master, terminologia) usati dal plugin per i check automatici di coerenza.

## Workflow tipico

1. `/book-init okr-the-right-way` — scaffolda il progetto
2. Compilare `book-config.md` con framework, personaggi, timeline
3. Scrivere capitoli in `capitoli/` (l'hook valida Markua in automatico)
4. `/book-source documento.pdf` — aggiungere e indicizzare fonti
5. `/book-review capitoli/ch05.md` — revisione completa del capitolo
6. `/book-status .` — panoramica e aggiornamento `stato-libro.md`
7. `/book-coherence .` — verifica coerenza tra tutti i capitoli
8. `/book-coherence ./okr-the-right-way ./kpi-the-right-way` — coerenza tra libri

## Serie "the Right Way"

Il plugin è progettato per gestire più libri della serie in modo coerente. La terminologia, i formati e le convenzioni sono condivise tra tutti i volumi. Ogni volume è fruibile singolarmente; i riferimenti ad altri volumi sono approfondimenti, mai prerequisiti.
