---
description: Panoramica dello stato del libro e aggiornamento stato-libro.md
allowed-tools: Read, Write, Grep, Glob, Bash(git:*)
argument-hint: [directory-libro]
---

Genera una panoramica completa dello stato del libro e la salva automaticamente in `stato-libro.md`.

La directory del libro è $ARGUMENTS (o la directory corrente se non specificata).

## Struttura attesa del progetto

```
nome-libro/
├── capitoli/          ← manuscript (LeanPub o altra piattaforma), contiene book.txt
├── fonti/             ← fonti di riferimento, contiene fonti.md
├── assets/            ← immagini, esercizi, template
├── book-config.md     ← metadati del libro
└── stato-libro.md     ← file generato da questo command
```

## Processo

1. **Leggere `book-config.md`** (se presente) per titolo, stato, struttura attesa.

2. **Leggere `capitoli/book.txt`** per l'elenco dei capitoli.

3. **Per ogni capitolo**, rilevare:
   - Nome file e titolo H1
   - Numero di righe e parole
   - Presenza degli elementi obbligatori (epigrafe, hook, Quick Win, Checkpoint)
   - Conteggio callout per tipo (T>, W>, Q>)
   - Presenza Fine Parte (se applicabile)

4. **Calcolare statistiche globali:**
   - Totale parole del libro
   - Media parole per capitolo
   - Distribuzione callout complessiva
   - Capitoli con elementi mancanti

5. **Verificare fonti:** se presente `fonti/`, elencare fonti disponibili e stato di integrazione.

6. **Verificare assets:** conteggio file per sotto-directory (images/, exercises/, templates/).

7. **Verificare book-config.md:** segnalare sezioni non compilate.

8. **Presentare e salvare** il risultato sia in output sia in `stato-libro.md`:

```markdown
# Stato libro — [titolo]

*Ultimo aggiornamento: [data/ora]*

## Panoramica

| Metrica | Valore |
| :--- | :--- |
| Stato | bozza / revisione / pronto |
| Capitoli | N |
| Appendici | N |
| Parole totali | XX.XXX |
| Media parole/capitolo | X.XXX |

## Capitoli

| # | File | Titolo | Parole | Epigrafe | Quick Win | Checkpoint | T> | W> | Q> |
|---|------|--------|--------|----------|-----------|------------|----|----|-----|
| 2 | ch02.md | Cap 2: ... | 3200 | ✅ | ✅ | ✅ | 6 | 2 | 1 |
| ... |

## Elementi mancanti

- Cap N: [elemento mancante]
- ...

## Fonti

- Totale: N fonti indicizzate
- Integrate nel testo: N
- Non ancora usate: N

## Assets

- Immagini: N file
- Esercizi: N file
- Template: N file

## Book config

- [ ] Framework centrale: compilato / da compilare
- [ ] Caso studio: compilato / da compilare
- [ ] Personaggi: compilati / da compilare
- [ ] Timeline master: compilata / da compilare
- [ ] Terminologia: compilata / da compilare

## Prossime azioni consigliate

1. ...
2. ...
3. ...
```

Il file `stato-libro.md` viene sovrascritto ad ogni esecuzione di questo command. Non modificarlo manualmente.

## Git commit

Dopo aver aggiornato `stato-libro.md`, se ci si trova in un repository git (`git rev-parse --is-inside-work-tree 2>/dev/null`), eseguire:

```bash
git add * && git commit -m "book-status: aggiornamento stato-libro.md — [N] capitoli, [totale] parole"
```

Se non ci si trova in un repository git, non fare nulla.
