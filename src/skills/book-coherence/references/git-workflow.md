# Git Workflow — Commit automatici

Ogni comando del plugin che modifica file nel progetto libro deve concludere con un commit git automatico, se il progetto è un repository git.

## Regole

1. **Verificare** se ci si trova in un repository git: `git rev-parse --is-inside-work-tree 2>/dev/null`
2. **Se sì:** eseguire `git add *` e poi `git commit -m "[prefisso-comando]: [descrizione attività]"`
3. **Se no:** non fare nulla, proseguire senza menzionare git

## Formato del messaggio di commit

```
[prefisso-comando]: [descrizione sintetica dell'attività svolta]
```

Esempi:
- `book-review: revisione editoriale ch05-validazione.md — scorecard 62/70`
- `book-markua: fix 3 errori formato in ch08-scaling.md`
- `book-coherence: fix cross-reference Cap 5 → Cap 3`
- `book-source: aggiunta fonte "Beyond Budgeting" (PDF)`
- `book-status: aggiornamento stato-libro.md`
- `book-init: scaffolding progetto okr-the-right-way`

## Comandi che devono committare

| Comando | Quando committa |
| :--- | :--- |
| `/book-init` | Dopo la creazione della struttura |
| `/book-review` | Se applica correzioni al testo |
| `/book-markua` | Se applica fix al formato |
| `/book-coherence` | Se applica correzioni di coerenza |
| `/book-source` | Dopo l'aggiunta di una fonte |
| `/book-status` | Dopo l'aggiornamento di stato-libro.md |

## Comandi che NON committano

I comandi che operano in sola lettura (senza modificare file) non devono committare. Se un comando viene eseguito solo in modalità di analisi (senza applicare fix), non committa.

## Comportamento in caso di errore git

Se il commit fallisce (es. nessun file modificato, errore git), ignorare l'errore e proseguire. Non interrompere il flusso del comando per problemi git.
