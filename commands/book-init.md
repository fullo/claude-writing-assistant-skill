---
description: Scaffolda la struttura di un nuovo libro
allowed-tools: Read, Write, Bash(mkdir:*), Bash(cp:*), Bash(git:*)
argument-hint: [nome-libro]
---

Crea la struttura completa per un nuovo progetto libro.

Il nome del libro è $1. Creare la directory all'interno della directory corrente (che dovrebbe essere la root `libri/` o analoga).

## Configurazione iniziale

**Prima di creare i file**, chiedere all'utente (se non specificato nel comando):
1. **Titolo completo** del libro
2. **Autore** (nome e affiliazione)
3. **Lingua** del libro (default: italiano)
4. **Piattaforma** di pubblicazione (default: LeanPub/Markua)
5. **Serie** (opzionale — lasciare vuoto se libro singolo)
6. **Tono target** (default: conversazionale-esperto)

Se l'utente non specifica un valore, usare i default indicati. Se l'utente fornisce tutto nel comando, procedere senza chiedere.

## Struttura da creare

A livello serie (directory corrente):
```
libri/
├── cross-reference.md             ← mappa cross-reference (creato se non esiste e se c'e una serie)
└── $1/
    ├── capitoli/                  ← manuscript (LeanPub o altro)
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
Leggere il template da `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/references/book-config-template.md` e generare un `book-config.md` con la struttura completa. Pre-compilare con i valori forniti dall'utente (o i default):
- **Serie:** [valore utente, o vuoto se non specificato]
- **Autore:** [valore utente]
- **Lingua:** [valore utente, default: italiano]
- **Piattaforma:** [valore utente, default: LeanPub (Markua)]
- **Stato:** bozza
- **Tono target:** [valore utente, default: conversazionale-esperto]

Compilare la sezione **Stile e Tono** con i default appropriati per la lingua scelta:
- Per italiano: registro informale (tu), pattern Esperienza → Problema → Soluzione → Esercizio
- Per english: registro neutro, pattern Experience → Problem → Solution → Exercise
- Per altre lingue: adattare i default al contesto culturale della lingua

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
**Solo se l'utente ha specificato una serie.** Verificare se nella directory corrente esiste gia un file `cross-reference.md`. Se **non esiste**, crearlo con la struttura base seguendo il template della Parte 2 di `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/references/cross-reference.md`. Usare il nome della serie fornito dall'utente nel titolo (non hardcoded).

Se **esiste gia**, aggiornare solo la lista "Volumi censiti" aggiungendo il nuovo volume $1.

## Inizializzazione Git

Dopo aver creato tutti i file, verificare se `git` e disponibile nel sistema:

```bash
which git
```

**Se git e disponibile:**
1. Entrare nella directory del libro: `cd $1`
2. Inizializzare il repository: `git init .`
3. Fare il primo commit: `git add * && git commit -m "book-init: scaffolding progetto $1"`
4. Comunicare all'utente che il repository e stato creato e che i comandi del plugin faranno commit automatici.

**Se git NON e disponibile:**
1. Avvisare l'utente: "Git non e installato nel sistema. Il progetto e stato creato senza versionamento. I comandi del plugin non faranno commit automatici. Per abilitare il versionamento, installa git e poi esegui `git init .` nella directory del libro."
2. Proseguire normalmente senza ulteriori riferimenti a git.

## Dopo la creazione

Mostrare la struttura creata e suggerire i prossimi passi:
1. Compilare `book-config.md` con framework centrale, caso studio e personaggi
2. Creare il primo capitolo in `capitoli/`
3. Aggiornare `book.txt` con il nome del file
4. Usare `/book-source` per aggiungere fonti di riferimento
