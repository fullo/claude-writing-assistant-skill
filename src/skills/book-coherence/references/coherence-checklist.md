# Checklist di Coerenza — Dettagliata

## A. Coerenza intra-libro

### A1. Caso studio — Timeline

Per ogni capitolo, estrarre:
- Periodo temporale esplicito (mese, trimestre, anno)
- Eventi chiave che accadono nel capitolo
- Riferimenti temporali relativi ("tre mesi dopo", "il trimestre successivo")

Verificare:
- [ ] La sequenza temporale è monotonicamente crescente
- [ ] I riferimenti relativi sono coerenti con i periodi espliciti
- [ ] Non ci sono salti temporali inspiegati
- [ ] La timeline è coerente con quella master in Appendice E

### A2. Caso studio — Numeri

Per ogni capitolo, estrarre tutti i numeri: revenue, utenti, headcount, metriche di performance, percentuali, budget.

Verificare:
- [ ] I numeri seguono una progressione logica tra capitoli
- [ ] Le percentuali sono matematicamente corrette (es. se il team è 10 persone e 3 sono senior, deve essere 30%)
- [ ] I numeri citati in capitoli diversi per lo stesso periodo corrispondono
- [ ] Nessun numero contraddice un dato presentato precedentemente senza spiegazione
- [ ] Le unità di misura sono coerenti (€ vs $, k vs M, % vs valore assoluto)

### A3. Caso studio — Personaggi

Per ogni personaggio, tracciare:
- Nome completo e varianti usate
- Ruolo/titolo
- Tratti caratteriali e competenze
- Posizioni espresse nei dialoghi

Verificare:
- [ ] Il nome è sempre scritto nello stesso modo
- [ ] Il ruolo non cambia senza spiegazione narrativa
- [ ] Le competenze mostrate sono coerenti con il ruolo
- [ ] Le posizioni nei dialoghi sono coerenti con la caratterizzazione
- [ ] L'arco narrativo (se presente) è coerente e credibile

### A4. Cross-reference

Estrarre tutti i pattern "(vedi Capitolo N)" e "Come abbiamo visto nel Capitolo N".

Verificare:
- [ ] Il capitolo citato esiste
- [ ] Il capitolo citato effettivamente tratta il concetto menzionato
- [ ] Non ci sono concetti rispiegati che dovrebbero avere un cross-reference
- [ ] I cross-reference sono bidirezionali dove appropriato
- [ ] Nessun cross-reference punta a un capitolo che viene dopo (forward reference), salvo anticipazioni esplicite

### A5. Framework centrale

Identificare il framework centrale e il capitolo in cui è introdotto.

Verificare:
- [ ] Introdotto entro il primo terzo del libro
- [ ] I termini usati per descriverlo sono identici in ogni capitolo
- [ ] Non viene rispiegato dopo l'introduzione (solo richiamato)
- [ ] È presente nei capitoli dove è rilevante
- [ ] Non è forzato in capitoli dove non serve

### A6. Struttura obbligatoria

Per ogni capitolo, verificare:
- [ ] Epigrafe presente
- [ ] Hook narrativo con caso studio
- [ ] Almeno un Quick Win in `{blurb}`
- [ ] Checkpoint con checkbox
- [ ] Fine Parte (solo per capitoli di chiusura)

### A7. Distribuzione callout

Compilare matrice:

| Elemento | Cap N | Cap N+1 | Cap N+2 | ... |
| :--- | :---: | :---: | :---: | :---: |
| T> Insight | count | count | count | ... |
| W> Red Flag | count | count | count | ... |
| Q> Socratica | count | count | count | ... |
| Quick Win | ✅/❌ | ✅/❌ | ✅/❌ | ... |
| Checkpoint | ✅/❌ | ✅/❌ | ✅/❌ | ... |

## B. Coerenza inter-libro

### B1. Terminologia condivisa

Identificare tutti i concetti che compaiono in più volumi.

Per ciascun concetto:
- [ ] La definizione è identica o compatibile tra volumi
- [ ] I termini canonici sono gli stessi
- [ ] Se un volume usa una versione semplificata, è chiaramente indicato come tale

### B2. Cross-reference cross-volume

Per ogni riferimento a un altro volume:
- [ ] Il formato è "Per approfondire: [Titolo], Cap. N"
- [ ] Il capitolo citato nell'altro volume esiste
- [ ] Il contenuto descritto corrisponde al contenuto effettivo
- [ ] Non è formulato come prerequisito ("devi leggere prima")
- [ ] Il testo è autosufficiente anche senza leggere l'altro volume

### B3. Caso studio condiviso

Se i volumi condividono l'azienda del caso studio:
- [ ] Nome dell'azienda identico
- [ ] Anno di fondazione coerente
- [ ] Personaggi con stessi nomi e ruoli
- [ ] Numeri coerenti per periodi sovrapposti
- [ ] Timeline compatibili

### B4. Formattazione

- [ ] Stesse label per callout in tutti i volumi
- [ ] Nessuna emoji in nessun volume
- [ ] Stessi formati canonici Markua

## C. Gestione fonti e materiale di riferimento

### C1. Fonti per libro

Ogni libro può avere una directory `sources/` nella cartella manuscript contenente:
- File PDF di riferimento
- File TXT con note e appunti
- File `sources.md` con link esterni e descrizione

### C2. Tracciabilità fonti → contenuto

Per ogni affermazione fattuale o dato numerico nel testo:
- [ ] La fonte è identificabile
- [ ] L'attribuzione è esplicita ("secondo [nome organizzazione/studio]")
- [ ] Il dato è trascritto fedelmente dalla fonte

### C3. Bibliografia

Verificare che tutti i riferimenti nel testo compaiano nella bibliografia e viceversa.
