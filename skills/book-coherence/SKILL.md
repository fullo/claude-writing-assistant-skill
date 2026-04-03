---
name: book-coherence
description: >
  Use when the user asks to check coherence, verify narrative continuity, validate case study
  numbers, cross-reference chapters, or ensure consistency across multiple books in a series.
  Also trigger when editing multi-chapter content and the user mentions checking references,
  terminology, or timeline consistency across the manuscript.
  Attivare anche quando l'utente chiede di "controllare la coerenza", "verificare la continuità
  narrativa", "controllare i numeri del caso studio", "cross-check tra capitoli",
  "verificare la timeline", "confrontare con l'altro libro", "verificare terminologia tra libri".
version: 1.0.0
---

# Coerenza Narrativa — Intra-libro e Inter-libro

Skill per verificare la coerenza interna di un libro e la coerenza tra libri diversi della serie "the Right Way". Opera su due livelli: capitolo-vs-capitolo e libro-vs-libro.

## Livello 1: Coerenza intra-libro (tra capitoli)

### Caso studio narrativo

Il caso studio attraversa tutti i capitoli in ordine cronologico. Verificare:

1. **Timeline** — gli eventi seguono una progressione temporale coerente. Controllare riferimenti espliciti a mesi, trimestri, periodi. Confrontare con la timeline master (tipicamente in Appendice E).

2. **Numeri** — revenue, metriche, headcount, percentuali devono essere coerenti tra capitoli. Se nel Cap 3 l'azienda ha 45 dipendenti e nel Cap 7 ne ha 52, deve esistere un passaggio che giustifica la crescita.

3. **Personaggi** — ruoli, nomi, personalità devono restare consistenti. Verificare: nome sempre scritto uguale, ruolo non cambiato senza spiegazione, caratterizzazione coerente (un personaggio prudente non diventa improvvisamente avventato senza un arco narrativo).

4. **Progressione realistica** — il caso studio include fallimenti, correzioni e crescita graduale. Non solo successi.

### Cross-reference interni

Verificare che ogni cross-reference "(vedi Capitolo N)" punti a un capitolo che effettivamente tratta quel concetto. I cross-reference devono essere bidirezionali quando entrambi i capitoli toccano lo stesso tema.

**Regola:** un concetto spiegato nel Capitolo N non deve essere rispiegato nei capitoli successivi. Deve essere richiamato brevemente e rimandato con cross-reference.

### Framework centrale

Il framework centrale del libro deve essere:
- Introdotto nel primo terzo del libro
- Richiamato (mai rispiegato) nei capitoli successivi dove è rilevante
- Espresso con linguaggio specifico e coerente (stessi termini, stesse definizioni)

Segnalare: capitoli dove il framework dovrebbe essere presente ma è assente, o dove il linguaggio diverge dalla definizione iniziale.

### Struttura obbligatoria per capitolo

Verificare che ogni capitolo contenga tutti gli elementi obbligatori:
- Epigrafe
- Hook narrativo (con caso studio)
- Quick Win (in `{blurb}`)
- Checkpoint (con checkbox)
- Fine Parte (solo per capitoli di chiusura Parte)

### Distribuzione callout

Controllare distribuzione tra capitoli e segnalare anomalie:
- T> Insight: 2–6 per capitolo (tipico)
- W> Red Flag: 0–3 per capitolo
- Q> Domanda Socratica: 0–1 per capitolo

Capitoli senza nessun callout meritano una segnalazione (non bloccante).

## Livello 2: Coerenza inter-libro (tra volumi)

### Terminologia condivisa

Dove i concetti si sovrappongono tra volumi (es. Output/Outcome compare in più libri), la terminologia deve essere coerente. Stesse definizioni, stessi termini canonici.

### Riferimenti cross-volume

Formula obbligatoria: "Per approfondire: [Titolo], Cap. N". Mai come prerequisito ("devi leggere prima X"), sempre come approfondimento opzionale.

Per le regole complete di validazione, i pattern di rilevamento, i vincoli V1–V8 e la classificazione dei tipi di cross-reference (A/B/C/D): **`references/cross-reference.md`**

Verificare che:
- I rimandi puntino a capitoli che esistono nell'altro volume
- Le descrizioni del contenuto rimandato siano accurate
- Nessun volume assuma contenuto dell'altro come prerequisito
- Il formato sia quello canonico (vedi `references/cross-reference.md`, sezione 1.2)
- I rimandi siano bidirezionali dove appropriato

### Caso studio cross-volume

Se i volumi condividono personaggi o aziende (es. Karma Inc.), verificare coerenza di: nomi, ruoli, timeline, numeri. Se un libro dice che Karma Inc. è stata fondata nel 2019, tutti i libri devono usare lo stesso anno.

### Callout e formattazione

Tutti i libri della serie devono usare le stesse label per i callout, senza emoji, con gli stessi formati canonici.

## Struttura progetto attesa

```
libri/                             ← root della serie
├── cross-reference.md             ← mappa cross-reference inter-libro (livello serie)
├── nome-libro/
│   ├── capitoli/                  ← manuscript LeanPub, contiene book.txt e i .md
│   ├── fonti/                     ← fonti di riferimento
│   ├── assets/                    ← immagini, esercizi, template
│   └── book-config.md             ← metadati: personaggi, timeline, framework, terminologia
└── altro-libro/
    └── ...
```

Il file `book-config.md` è il riferimento principale per i check di coerenza intra-libro. Se presente, usare i dati strutturati (timeline master, personaggi, terminologia) come base di confronto. Se assente, inferire dal testo e suggerire di crearlo con `/book-init`.

Il file `cross-reference.md` a livello serie è il riferimento per i check inter-libro. Se presente, usarlo come base per la validazione dei rimandi. Se assente, generarlo automaticamente durante il primo check inter-libro (vedi `references/cross-reference.md` per il template).

Per il template di `book-config.md`: **`references/book-config-template.md`**

## Processo di verifica

1. **Leggere `book-config.md`** per timeline master, personaggi, framework, terminologia
2. **Leggere `capitoli/book.txt`** per identificare l'ordine dei capitoli
3. **Costruire mappa** dei concetti principali per capitolo
4. **Estrarre** tutti i numeri del caso studio e i cross-reference
5. **Confrontare** ogni dato con la timeline master in `book-config.md`
6. **Segnalare** ogni incongruenza con capitolo, riga e proposta di correzione

## Formato di output

```
COERENZA INTRA-LIBRO
====================

Timeline:
- [CAP N vs CAP M] Incongruenza: nel Cap N si dice X, nel Cap M si dice Y
  → Proposta: uniformare a X/Y perché...

Numeri:
- [CAP N, riga ~XX] Revenue dichiarata: €XXk
- [CAP M, riga ~YY] Revenue dichiarata: €YYk (incongruente)
  → Proposta: verificare con timeline master

Personaggi:
- [CAP N] Marco è "CTO" — [CAP M] Marco è "VP Engineering"
  → Proposta: uniformare al ruolo corretto

Cross-reference:
- [CAP N] "(vedi Capitolo M)" — Capitolo M non tratta questo concetto
  → Proposta: correggere riferimento

COERENZA INTER-LIBRO (se applicabile)
======================================

Terminologia:
- [Libro A, Cap N] usa "XYZ" — [Libro B, Cap M] usa "ABC" per lo stesso concetto
  → Proposta: uniformare a "XYZ" perché...
```

## Gotchas

- **Cross-book references can be stale**: When updating one book in a series, cross-references in other books may become invalid. Always check all books in the series, not just the one being edited.
- **Case study numbers must be internally consistent**: A case study mentioned in Chapter 2 with "30% improvement" cannot appear in Chapter 7 as "25% improvement." Extract all numeric claims and cross-check.
- **Chapter order may differ from writing order**: Authors don't always write linearly. Check the book config (Book.txt or equivalent) for canonical order before validating continuity.

## Risorse dettagliate

Per la checklist completa di coerenza: **`references/coherence-checklist.md`**

Per le regole di cross-reference inter-libro e il template della mappa: **`references/cross-reference.md`**
