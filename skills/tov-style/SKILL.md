---
name: tov-style
description: >
  Use when the user asks to review tone of voice, check writing style, verify grammar
  and quality, apply editorial standards, or ensure consistent register across a manuscript.
  Also trigger when the user mentions proofreading text, checking formality level, or
  reviewing writing for publication readiness in any language.
  Attivare anche quando l'utente chiede di "rivedere il tono", "controllare lo stile",
  "verificare la qualità della scrittura", "controllare la grammatica",
  "valutare il capitolo", "review editoriale", "scorecard di qualità", "validare il TOV".
version: 2.0.1
---

# TOV & Writing Style

Skill di riferimento per tono di voce, stile narrativo, qualità linguistica e scorecard editoriale. Questa skill è language-aware: adatta i controlli alla lingua configurata nel progetto.

## Configurazione lingua

**Prima di qualsiasi controllo**, leggere `book-config.md` nella root del progetto libro:

1. Leggere il campo **Lingua** (default: italiano se non specificato)
2. Leggere la sezione **Stile e Tono** per: tono target, registro, pattern narrativo, termini vietati
3. Caricare le regole grammaticali dal language pack appropriato:
   - Se esiste `references/{lang}/grammar-rules.md` → caricare e applicare
   - Se NON esiste → usare `references/grammar-framework.md` come guida per generare check appropriati nella lingua target
4. Caricare la style guide dal language pack se esiste: `references/{lang}/style-guide.md`

**Language pack disponibili:**
- `it/` — Italiano: 15 regole dettagliate (R1-R15), style guide completa
- `en/` — English: 15 rules (R1-R15), starter pack

Per lingue senza pack dedicato, il framework generico (`grammar-framework.md`) fornisce le 15 categorie di regole (R1-class...R15-class) con indicazioni su come adattarle.

## Tono di voce

Il tono è definito in `book-config.md` sezione **Stile e Tono**, campo **Tono target**. Se non specificato, il default è **conversazionale-esperto**: il tono di un collega senior che spiega qualcosa a un pari. Non un professore, non un guru, non un divulgatore che semplifica eccessivamente.

**Caratteristiche del tono conversazionale-esperto (default):**

- **Confidenziale ma competente** — espressioni colloquiali nei passaggi di transizione, mai nelle spiegazioni tecniche dove il registro resta preciso
- **Auto-ironico quando appropriato** — ammettere limiti è un segno di competenza
- **Diretto** — preferire parole concrete a perifrasi
- **Mai condiscendente** — il lettore è un professionista

**Adattamento per lingua:** ogni lingua ha le proprie espressioni colloquiali e marcatori di familiarità. Usare quelli naturali della lingua target, non tradurre quelli di un'altra lingua.

### Benchmark quantitativi (target per capitolo, adattabili)

| Indicatore | Target | Range accettabile |
| :--- | :---: | :---: |
| Marcatori colloquiali | 8 | 3–16 |
| Riferimenti personali autore | 2 | 0–5 |
| Narrative personali estese per Parte | 1 | 0–1 |
| Cross-reference | 8 | 4–16 |
| Paragrafi in prosa (>100 char) | 50+ | 40–80 |

Questi benchmark vanno adattati alla lingua e al tono. In tono formale, i marcatori colloquiali saranno zero.

## Prosa narrativa, non elenchi

Il libro è scritto in prosa continua. La tendenza a trasformare spiegazioni in elenchi puntati è il primo nemico della qualità.

**Elenchi ammessi:** checklist nei Checkpoint, step numerati nei processi, tabelle comparative, formattazione inline di framework di dominio.

**Elenchi vietati:** spiegazioni di concetti, narrazioni, sequenze di esempi (max 2 in prosa per concetto), riassunti di fine sezione.

Convertire sempre elenchi narrativi in prosa che spiega il "perché" di ogni punto.

## Pattern narrativo obbligatorio per capitolo

Il pattern è definito in `book-config.md` sezione **Stile e Tono**, campo **Pattern narrativo**. Se non specificato, il default è: **Esperienza → Problema → Soluzione → Esercizio**.

1. **Hook** — esperienza concreta dal caso studio con contesto temporale, numeri, dialoghi
2. **Problema** — il caso rivela un pattern ricorrente, generalizzazione dall'esperienza al principio
3. **Soluzione** — framework introdotto come risposta: prima il principio, poi la struttura, infine 1–2 esempi pratici
4. **Esercizio** — Quick Win + Checkpoint. Non opzionale.

Rapporto target: definito in book-config.md (default: **30% teoria / 70% pratica**).

## Linguaggio

**Sentence case** per tutti i titoli — prima lettera maiuscola, resto minuscolo tranne nomi propri, acronimi. (Per lingue con Title Case prevalente come l'inglese, seguire la convenzione in book-config.md.)

**Termini tecnici stranieri:** le regole dipendono dalla lingua del libro. Vedere il language pack appropriato (`references/{lang}/grammar-rules.md`) per le regole R1/R1-class specifiche.

**Termini vietati:** definiti in book-config.md sezione **Stile e Tono** e/o nel language pack della lingua.

## Dialoghi

I dialoghi tra personaggi del caso studio sono il principale veicolo del tono conversazionale. Regole: emergono dal contesto (non artificiali), personaggi difendono posizioni diverse, il dialogo rivela il problema e la prosa lo analizza, max 4–5 battute consecutive senza commento narrativo.

## Internazionalizzazione e Localizzazione

Quando si scrive o si revisiona un libro:

- **Modi di dire:** usare espressioni idiomatiche naturali della lingua target, non calchi da altre lingue
- **Registro:** rispettare il livello di formalità definito in book-config.md (tu/Lei/Voi in italiano, du/Sie in tedesco, tu/vous in francese, etc.)
- **Formati locali:** numeri, date, valute, unità di misura seguono le convenzioni della lingua/cultura target (vedi R6-class in grammar-framework.md)
- **Esempi e metafore:** devono essere comprensibili nella cultura target

## Gotchas

- **Variazioni regionali**: ogni lingua ha varianti regionali (es. italiano settentrionale vs meridionale, inglese americano vs britannico). Verificare quale variante l'autore usa prima di suggerire correzioni.
- **Pronomi di cortesia**: verificare la convenzione del libro prima di suggerire cambiamenti (tu/Lei/Voi in italiano, you in inglese, du/Sie in tedesco).
- **Anglicismi/prestiti**: in contesti tecnici, molti prestiti sono accettati anche in lingue che tradizionalmente li evitano. Non suggerire traduzioni forzate per termini tecnici consolidati a meno che l'autore lo richieda esplicitamente.

## Risorse dettagliate

Per il framework generico di regole (tutte le lingue): **`references/grammar-framework.md`**
Per le regole specifiche per lingua: **`references/{lang}/grammar-rules.md`** (sostituire {lang} con il codice lingua)
Per la style guide specifica per lingua: **`references/{lang}/style-guide.md`** (se esiste)
Per la scorecard di qualità: **`references/scorecard.md`**
