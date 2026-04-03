---
description: Scaffolda la struttura di un nuovo libro
allowed-tools: Read, Write, Bash(mkdir:*), Bash(cp:*), Bash(git:*)
argument-hint: [nome-libro]
---

Crea la struttura completa per un nuovo libro della serie "the Right Way".

Il nome del libro è $1. Creare la directory all'interno della directory corrente (che dovrebbe essere la root `libri/`).

## Struttura da creare

A livello serie (directory corrente `libri/`):
```
libri/
├── cross-reference.md             ← mappa cross-reference (creato se non esiste)
└── $1/
    ├── capitoli/                  ← manuscript LeanPub
    │   └── book.txt               ← elenco capitoli (vuoto, da compilare)
    ├── fonti/                     ← fonti di riferimento
    │   └── fonti.md               ← indice fonti
    ├── assets/                    ← materiale di supporto
    │   ├── images/                ← immagini e screenshot
    │   ├── exercises/             ← JSON esercizi, carte
    │   └── templates/             ← template, canvas
    ├── book-config.md             ← metadati e configurazione del libro
    └── stato-libro.md             ← generato automaticamente da /book-status
```

## File da popolare

### book.txt
Creare vuoto con un commento:
```
# Elenco capitoli — aggiungere un file .md per riga
# Esempio:
# ch01-introduzione.md
# ch02-hook.md
```

### fonti/fonti.md
```markdown
# Fonti di riferimento — $1

Nessuna fonte ancora indicizzata. Usare `/book-source [file-o-url]` per aggiungere fonti.
```

### book-config.md
Leggere il template da `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/references/book-config-template.md` e generare un `book-config.md` con la struttura completa ma campi vuoti da compilare. Pre-compilare:
- Serie: the Right Way
- Autore: Francesco Fullone — Daruma Consulting
- Lingua: italiano
- Piattaforma: LeanPub (Markua)
- Stato: bozza

### stato-libro.md
Creare con intestazione base:
```markdown
# Stato libro — $1

Generato automaticamente da `/book-status`. Non modificare manualmente.

*Nessun capitolo ancora presente.*
```

### .gitignore
Creare nella root del libro:
```
# File generati automaticamente
stato-libro.md

# OS files
.DS_Store
Thumbs.db
```

### cross-reference.md (livello serie)
Verificare se nella directory corrente (la root `libri/`) esiste già un file `cross-reference.md`. Se **non esiste**, crearlo con la struttura base seguendo il template della Parte 2 di `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/references/cross-reference.md`:

```markdown
# Cross-Reference — Serie "the Right Way"

Ultimo aggiornamento: [data odierna]
Volumi censiti: $1
Totale cross-reference: 0

## Registro rimandi

| # | Volume sorgente | Cap. | Riga ~ | Volume target | Cap. target | Tipo | Formato OK | Bidirezionale | Note |
| :--- | :--- | :---: | :---: | :--- | :---: | :---: | :---: | :---: | :--- |
| — | — | — | — | — | — | — | — | — | Nessun rimando ancora censito |

## Concetti condivisi

| Concetto | Volume A | Definizione A (sintetica) | Volume B | Definizione B (sintetica) | Coerente |
| :--- | :--- | :--- | :--- | :--- | :---: |
| — | — | — | — | — | — |

## Caso studio condiviso

Nessun dato ancora disponibile. Verrà popolato dal primo `/book-coherence` inter-libro.

## Problemi aperti

Nessun problema. Eseguire `/book-coherence` con due directory per il primo check inter-libro.
```

Se **esiste già**, aggiornare solo la lista "Volumi censiti" aggiungendo il nuovo volume $1.

## Inizializzazione Git

Dopo aver creato tutti i file, verificare se `git` è disponibile nel sistema:

```bash
which git
```

**Se git è disponibile:**
1. Entrare nella directory del libro: `cd $1`
2. Inizializzare il repository: `git init .`
3. Fare il primo commit: `git add * && git commit -m "book-init: scaffolding progetto $1"`
4. Comunicare all'utente che il repository è stato creato e che i comandi del plugin faranno commit automatici.

**Se git NON è disponibile:**
1. Avvisare l'utente: "Git non è installato nel sistema. Il progetto è stato creato senza versionamento. I comandi del plugin non faranno commit automatici. Per abilitare il versionamento, installa git e poi esegui `git init .` nella directory del libro."
2. Proseguire normalmente senza ulteriori riferimenti a git.

## Dopo la creazione

Mostrare la struttura creata e suggerire i prossimi passi:
1. Compilare `book-config.md` con framework centrale, caso studio e personaggi
2. Creare il primo capitolo in `capitoli/`
3. Aggiornare `book.txt` con il nome del file
4. Usare `/book-source` per aggiungere fonti di riferimento
