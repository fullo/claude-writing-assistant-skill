# Cross-Reference della Serie — Regole e Mappa

Questo file e il **riferimento unico a livello serie** per gestire i rimandi incrociati tra i volumi di una collana. Vive nella root della serie (es. `libri/cross-reference.md`) ed è condiviso da tutti i libri.

Ha due scopi:

1. **Mappa generata** — registro di tutti i cross-reference trovati nei volumi, da aggiornare a ogni check di coerenza inter-libro.
2. **Regole di validazione** — pattern da cercare, vincoli da rispettare, errori tipici da segnalare.

---

## Parte 1 — Regole di validazione

### 1.1 Pattern di rilevamento

I cross-reference tra volumi seguono pattern testuali riconoscibili. Cercare (case-insensitive, regex):

```
# Rimandi espliciti ad altro volume
/[Pp]er approfondire:?\s+.+,\s+[Cc]ap\.?\s*\d+/
/[Cc]ome (abbiamo )?(visto|trattato|esplorato) in .+,\s+[Cc]ap\.?\s*\d+/
/[Nn]e (parliamo|parleremo) (in|nel volume)\s+.+/
/[Vv]edi (anche\s+)?["""].+["""],?\s+[Cc]ap\.?\s*\d+/

# Rimandi impliciti (segnali di possibile cross-reference mancante)
/[Cc]ome (spiegato|descritto|introdotto) (in precedenza|altrove)/
/[Pp]er (una trattazione|un'analisi) (più )?(completa|approfondita|dettagliata)/
```

### 1.2 Formato canonico

**Unico formato ammesso per rimandi cross-volume:**

```markdown
Per approfondire: *[Titolo del volume]*, Cap. N
```

Varianti e valutazione:

| Variante | Stato | Azione |
| :--- | :---: | :--- |
| `Per approfondire: *Titolo*, Cap. 5` | ✅ | Formato canonico |
| `Per approfondire: *Titolo*, Capitolo 5` | ⚠️ | Normalizzare a `Cap. 5` |
| `Come abbiamo visto in *Titolo*, Cap. 5` | ✅ | Ammesso per riferimenti retrospettivi |
| `Vedi *Titolo*, Cap. 5` | ⚠️ | Normalizzare a forma estesa |
| `Devi prima leggere *Titolo*` | ❌ | Vietato — mai prerequisito |
| `Senza aver letto *Titolo* non puoi...` | ❌ | Vietato — prerequisito implicito |
| `*Titolo* è propedeutico a...` | ❌ | Vietato — prerequisito esplicito |

### 1.3 Vincoli di validazione

Per ogni cross-reference trovato, verificare:

| # | Vincolo | Tipo | Descrizione |
| :--- | :--- | :---: | :--- |
| V1 | Volume target esiste | bloccante | Il titolo citato deve corrispondere a un libro reale della serie |
| V2 | Capitolo target esiste | bloccante | Il numero di capitolo deve esistere nel `book.txt` del volume target |
| V3 | Contenuto pertinente | bloccante | Il capitolo target deve effettivamente trattare il concetto menzionato |
| V4 | Mai prerequisito | bloccante | Il rimando non deve essere formulato come condizione necessaria per la comprensione |
| V5 | Autosufficienza | bloccante | Il testo del volume sorgente deve essere comprensibile anche senza seguire il rimando |
| V6 | Bidirezionalità | avvertimento | Se il concetto è rilevante in entrambe le direzioni, il rimando dovrebbe essere reciproco |
| V7 | Nessun duplicato eccessivo | avvertimento | Lo stesso rimando non dovrebbe comparire più di due volte nello stesso volume |
| V8 | Formato canonico | avvertimento | Il rimando dovrebbe seguire il formato standard (vedi 1.2) |

### 1.4 Tipi di cross-reference

I rimandi tra volumi si classificano in quattro categorie:

**Tipo A — Concetto condiviso**
Un concetto (es. "OKR", "Output vs Outcome") è trattato in entrambi i volumi ma da prospettive diverse.

Regola: il concetto nel volume sorgente deve avere una definizione sintetica autonoma, poi il rimando per approfondimento.

**Tipo B — Caso studio condiviso**
I volumi condividono personaggi o aziende. Il rimando collega gli archi narrativi.

Regola: i dati fattuali (nomi, ruoli, date, numeri) devono essere identici. Se il caso studio evolve nel tempo, la timeline deve essere compatibile.

**Tipo C — Strumento/Esercizio**
Un volume rimanda a un esercizio o strumento presentato in un altro.

Regola: il rimando deve citare titolo e capitolo dell'esercizio. Lo strumento deve poter essere usato autonomamente anche dal lettore che non ha l'altro volume.

**Tipo D — Framework**
Un volume richiama il framework centrale di un altro volume.

Regola: il framework deve essere riassunto in 1-2 frasi nel punto di rimando, mai dato per scontato.

### 1.5 Errori tipici

| Errore | Esempio | Gravità |
| :--- | :--- | :---: |
| Capitolo inesistente | "Vedi *OKR tRW*, Cap. 15" ma il libro ha solo 12 capitoli | critico |
| Contenuto non pertinente | "Per gli OKR vedi *Feedback tRW*, Cap. 3" ma Cap. 3 parla di altro | critico |
| Prerequisito esplicito | "Prima di continuare, leggi *OKR tRW*" | critico |
| Prerequisito implicito | "Dando per scontato che tu conosca il framework di *OKR tRW*" | critico |
| Formato non canonico | "come detto nell'altro libro al capitolo tre" | medio |
| Rimando unidirezionale | Volume A cita Volume B ma non viceversa su un tema condiviso | basso |
| Rimando ripetuto | Lo stesso "Per approfondire: X, Cap. N" compare 4+ volte nello stesso volume | basso |
| Titolo volume errato | "*OKR, the Right Way*" vs "*OKR the Right Way*" — varianti nel titolo | medio |

---

## Parte 2 — Template della mappa cross-reference

Il file `cross-reference.md` a livello serie viene generato e aggiornato automaticamente dal comando `/book-coherence` quando invocato con due o più directory-libro. La struttura è la seguente.

### 2.1 Intestazione

```markdown
# Cross-Reference — Serie "the Right Way"

Ultimo aggiornamento: [data]
Volumi censiti: [elenco titoli]
Totale cross-reference: [N]
```

### 2.2 Registro dei rimandi

Una riga per ogni cross-reference trovato nei testi:

```markdown
## Registro rimandi

| # | Volume sorgente | Cap. | Riga ~ | Volume target | Cap. target | Tipo | Formato OK | Bidirezionale | Note |
| :--- | :--- | :---: | :---: | :--- | :---: | :---: | :---: | :---: | :--- |
| 1 | OKR tRW | 3 | ~45 | Feedback tRW | 7 | A | ✅ | ✅ | Concetto: cicli di feedback |
| 2 | Feedback tRW | 7 | ~120 | OKR tRW | 3 | A | ✅ | ✅ | Reciproco di #1 |
| 3 | OKR tRW | 5 | ~88 | Feedback tRW | 4 | C | ⚠️ | ❌ | Esercizio "Feedback Canvas" |
```

### 2.3 Mappa concetti condivisi

Concetti che compaiono in più volumi con le relative definizioni:

```markdown
## Concetti condivisi

| Concetto | Volume A | Definizione A (sintetica) | Volume B | Definizione B (sintetica) | Coerente |
| :--- | :--- | :--- | :--- | :--- | :---: |
| Output vs Outcome | OKR tRW, Cap. 2 | "[definizione]" | Feedback tRW, Cap. 5 | "[definizione]" | ✅ / ❌ |
```

### 2.4 Caso studio condiviso — Registro dati

Se i volumi condividono personaggi o aziende:

```markdown
## Caso studio condiviso

| Dato | Volume A (Cap. / riga ~) | Valore A | Volume B (Cap. / riga ~) | Valore B | Coerente |
| :--- | :--- | :--- | :--- | :--- | :---: |
| Nome azienda | OKR tRW, Cap. 1 / ~12 | Karma Inc. | Feedback tRW, Cap. 1 / ~8 | Karma Inc. | ✅ |
| Anno fondazione | OKR tRW, Cap. 1 / ~15 | 2019 | Feedback tRW, Cap. 2 / ~33 | 2019 | ✅ |
| CEO nome | OKR tRW, Cap. 1 / ~20 | Sara Chen | Feedback tRW, Cap. 1 / ~10 | Sara Chen | ✅ |
```

### 2.5 Problemi aperti

```markdown
## Problemi aperti

| # | Gravità | Volume | Cap. | Descrizione | Proposta |
| :--- | :---: | :--- | :---: | :--- | :--- |
| 1 | critico | OKR tRW | 8 | Rimando a Feedback tRW Cap. 15 — capitolo inesistente | Verificare capitolo corretto |
| 2 | medio | Feedback tRW | 3 | Formato non canonico: "vedi l'altro libro" | Riscrivere come "Per approfondire: *OKR the Right Way*, Cap. N" |
```

---

## Parte 3 — Processo di aggiornamento

### Quando aggiornare

Il file `cross-reference.md` a livello serie deve essere aggiornato:

1. A ogni `/book-coherence` inter-libro — il comando rigenera automaticamente il registro
2. A ogni revisione completa di un libro con `book-reviewer` — l'agente verifica i rimandi
3. Manualmente — quando si aggiunge un nuovo volume alla serie

### Come aggiornare

1. Scansionare tutti i file `.md` dentro `capitoli/` di ogni volume usando i pattern regex della sezione 1.1
2. Per ogni match, classificare il tipo (A/B/C/D) e verificare i vincoli V1–V8
3. Aggiungere/aggiornare una riga nel registro dei rimandi (sezione 2.2)
4. Confrontare le definizioni dei concetti condivisi tra volumi (sezione 2.3)
5. Se caso studio condiviso, estrarre e confrontare i dati fattuali (sezione 2.4)
6. Aggiornare la sezione "Problemi aperti" — aggiungere nuovi, rimuovere risolti
7. Aggiornare intestazione con data e conteggi

### Struttura attesa a livello serie

```
libri/
├── cross-reference.md          ← QUESTO FILE (generato/aggiornato)
├── okr-the-right-way/
│   ├── capitoli/
│   ├── fonti/
│   ├── assets/
│   └── book-config.md
├── feedback-the-right-way/
│   ├── capitoli/
│   ├── fonti/
│   ├── assets/
│   └── book-config.md
└── ...
```
