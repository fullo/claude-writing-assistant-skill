---
name: tov-style
description: >
  Questa skill va usata quando l'utente chiede di "rivedere il tono", "controllare lo stile",
  "verificare la qualità della scrittura", "controllare la grammatica italiana",
  "valutare il capitolo", "review editoriale", "scorecard di qualità",
  "validare il TOV", oppure quando sta scrivendo o modificando contenuto per la serie "the Right Way".
version: 0.1.0
---

# TOV & Stile di Scrittura — Serie "the Right Way"

Skill di riferimento per tono di voce, stile narrativo, qualità linguistica italiana e scorecard editoriale applicabili a tutti i volumi della serie.

## Tono di voce: conversazionale-esperto

Il tono è quello di un collega senior che spiega qualcosa a un pari davanti a un caffè. Non un professore, non un guru, non un divulgatore che semplifica eccessivamente.

**Caratteristiche chiave:**

- **Confidenziale ma competente** — espressioni come "diciamocelo", "ok?", "e va bene così" nei passaggi di transizione. Mai nelle spiegazioni tecniche, dove il registro resta preciso.
- **Auto-ironico quando appropriato** — ammettere limiti è un segno di competenza.
- **Diretto** — "casino" è accettabile, "situazione subottimale" no. "Aria fritta" è meglio di "contenuto a basso valore aggiunto".
- **Mai condiscendente** — il lettore è un professionista.

### Benchmark quantitativi (target per capitolo)

| Indicatore | Target | Range accettabile |
| :--- | :---: | :---: |
| Marcatori colloquiali | 8 | 3–16 |
| Riferimenti personali autore | 2 | 0–5 |
| Narrative personali estese per Parte | 1 | 0–1 |
| Cross-reference | 8 | 4–16 |
| Paragrafi in prosa (>100 char) | 50+ | 40–80 |

## Prosa narrativa, non elenchi

Il libro è scritto in prosa continua. La tendenza a trasformare spiegazioni in elenchi puntati è il primo nemico della qualità.

**Elenchi ammessi:** checklist nei Checkpoint, step numerati nei processi, tabelle comparative, formattazione inline di framework di dominio.

**Elenchi vietati:** spiegazioni di concetti, narrazioni, sequenze di esempi (max 2 in prosa per concetto), riassunti di fine sezione.

Convertire sempre elenchi narrativi in prosa che spiega il "perché" di ogni punto.

## Pattern narrativo obbligatorio per capitolo

Ogni capitolo segue: **Esperienza → Problema → Soluzione → Esercizio**.

1. **Hook** — esperienza concreta dal caso studio con contesto temporale, numeri, dialoghi.
2. **Problema** — il caso rivela un pattern ricorrente, generalizzazione dall'esperienza al principio.
3. **Soluzione** — framework introdotto come risposta: prima il principio, poi la struttura, infine 1–2 esempi pratici.
4. **Esercizio** — Quick Win + Checkpoint. Non opzionale.

Rapporto target: **30% teoria / 70% pratica**. In un capitolo di 400 righe, max ~120 di teoria.

## Linguaggio

**Sentence case** per tutti i titoli — prima lettera maiuscola, resto minuscolo tranne nomi propri, acronimi.

**Termini tecnici inglesi:** non tradurre gli standard internazionali del dominio. Tradurre tutto il resto. Alla prima occorrenza nel capitolo: forma italiana + inglese corsivo tra parentesi.

**Inglesismi vietati:** killare → eliminare, deployare → rilasciare, pushare → spingere/pubblicare, fixare → correggere, trackare → monitorare/tracciare, shiftare → spostare, performare → rendere/ottenere risultati, schedulare → programmare/pianificare, deliverare → consegnare.

## Dialoghi

I dialoghi tra personaggi del caso studio sono il principale veicolo del tono conversazionale. Regole: emergono dal contesto (non artificiali), personaggi difendono posizioni diverse, il dialogo rivela il problema e la prosa lo analizza, max 4–5 battute consecutive senza commento narrativo.

## Risorse dettagliate

Per le 15 regole di validazione stilistica italiana: **`references/italian-rules.md`**
Per la guida di stile completa: **`references/style-guide.md`**
Per la scorecard di qualità: **`references/scorecard.md`**
