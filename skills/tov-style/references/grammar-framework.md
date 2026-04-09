# Grammar & Style Framework — Language-Agnostic

Framework generico per la validazione grammaticale e stilistica di libri tecnici in qualsiasi lingua. Ogni categoria (R-class) descrive un aspetto universale della scrittura tecnica. I language pack (`references/{lang}/grammar-rules.md`) forniscono le regole specifiche per ogni lingua.

## Come usare questo framework

1. Leggere `book-config.md` per il campo **Lingua**
2. Se esiste `references/{lang}/grammar-rules.md`, caricare e applicare quelle regole
3. Se NON esiste un language pack, usare questo framework per generare check appropriati sfruttando la conoscenza della lingua target
4. I benchmark quantitativi vanno adattati alla lingua (es. frequenza di articoli varia tra lingue)

---

## R1-class — Lingua primaria vs. termini stranieri

**Scopo:** garantire che il testo sia scritto nella lingua primaria del libro, con termini stranieri gestiti in modo coerente.

**Cosa verificare:**
- I termini tecnici internazionali senza traduzione consolidata restano nella lingua originale
- I termini con traduzione consolidata vengono tradotti nella lingua primaria
- Alla prima occorrenza per capitolo: forma nella lingua primaria + originale in corsivo tra parentesi
- Occorrenze successive: solo forma nella lingua primaria

**Adattamento per lingua:** in inglese questa regola e meno rilevante (la maggior parte dei termini tecnici sono gia in inglese). Per lingue con forte tradizione di traduzione (francese, tedesco), applicare piu rigorosamente.

## R2-class — Forme verbali idiomatiche

**Scopo:** evitare calchi sintattici da altre lingue, preferire costruzioni naturali.

**Cosa verificare:**
- Le costruzioni verbali suonano naturali nella lingua target
- Non ci sono calchi dalla lingua di origine dei termini tecnici
- Le forme passive/attive seguono le convenzioni della lingua target

## R3-class — Preposizioni e reggenze

**Scopo:** usare le preposizioni idiomatiche della lingua target, non quelle ricalcate dall'inglese o da altre lingue.

**Cosa verificare:**
- Le reggenze preposizionali sono corrette per la lingua target
- Non ci sono calchi preposizionali da altre lingue

## R4-class — Concordanza grammaticale con prestiti linguistici

**Scopo:** garantire che i termini importati da altre lingue rispettino le regole grammaticali della lingua target.

**Cosa verificare:**
- Genere/numero dei prestiti linguistici (per lingue con genere grammaticale)
- Declinazione/coniugazione corretta (per lingue con sistema dei casi)
- Plurale dei prestiti: segue le regole della lingua target o della lingua di origine?

**Nota:** non tutte le lingue hanno questa complessita. L'inglese non ha genere grammaticale; il tedesco ha tre generi; il giapponese non ha plurali.

## R5-class — Determinanti (articoli, dimostrattivi)

**Scopo:** usare correttamente articoli e determinanti con i termini tecnici, compresi i prestiti.

**Cosa verificare:**
- Articoli non omessi dove la grammatica li richiede
- Articoli corretti davanti a termini stranieri

**Nota:** non tutte le lingue hanno articoli (es. giapponese, coreano, russo in parte). Per queste lingue, verificare altri determinanti equivalenti.

## R6-class — Formattazione numerica locale

**Scopo:** usare le convenzioni locali per numeri, date, valute, misure.

**Cosa verificare:**
- Separatore decimale: virgola (it, de, fr) vs punto (en)
- Separatore migliaia: punto (it, de) vs virgola (en) vs spazio (fr)
- Formato date: GG/MM/AAAA (it, fr) vs MM/DD/YYYY (en-US) vs DD.MM.YYYY (de)
- Simbolo valuta: posizione prima/dopo il numero
- Unita di misura: sistema metrico vs imperiale

**Eccezioni:** codici, URL, nomi propri, formule mantengono il formato originale.

## R7-class — Semplificazione lessicale

**Scopo:** preferire forme brevi e dirette, evitare burocratismo e perifrasi.

**Cosa verificare:**
- Parole brevi preferite a quelle lunghe quando equivalenti
- Nessuna perifrasi inutile
- Registro coerente con il tono definito in book-config.md

## R8-class — Determinanti obbligatori

**Scopo:** non omettere determinanti dove la grammatica li richiede, anche in contesti informali o tecnici.

**Cosa verificare:** determinanti presenti dove obbligatori nella lingua target.

## R9-class — Punteggiatura per elenchi e coordinate

**Scopo:** usare la punteggiatura corretta per la lingua nelle enumerazioni e coordinate.

**Cosa verificare:**
- Uso di punto e virgola, virgola, due punti secondo le convenzioni della lingua
- Serial comma (Oxford comma): obbligatoria in inglese formale, vietata in italiano, facoltativa in altre lingue

## R10-class — Modi verbali nelle subordinate

**Scopo:** usare il modo verbale corretto nelle subordinate (congiuntivo, condizionale, indicativo).

**Cosa verificare:**
- Congiuntivo nelle subordinate di scopo/ipotesi/giudizio (per lingue che lo hanno)
- Sequence of tenses corretta
- Konjunktiv in tedesco, subjonctif in francese, subjuntivo in spagnolo

**Nota:** l'inglese ha un congiuntivo residuale ma poco usato nella scrittura tecnica.

## R11-class — Negazioni complesse

**Scopo:** usare la forma corretta nelle negazioni con elenchi o alternative.

**Cosa verificare:**
- Struttura corretta delle negazioni coordinate nella lingua target
- "Neither...nor" (en), "ne...ne" (it), "ni...ni" (fr/es), "weder...noch" (de)

## R12-class — Virgola seriale (Serial comma)

**Scopo:** applicare la convenzione corretta per la virgola prima dell'ultimo elemento di un elenco.

**Cosa verificare:**
- Inglese: Oxford comma raccomandata in scrittura tecnica
- Italiano: virgola prima di "e"/"o" finale NON usata
- Altre lingue: seguire la convenzione locale

## R13-class — Localizzazione di heading e termini UI

**Scopo:** tradurre/localizzare etichette, titoli e nomi di sezione dove esiste una traduzione naturale.

**Cosa verificare:**
- Heading in lingua target (non in inglese a meno che sia un termine tecnico senza traduzione)
- Sentence case vs Title Case secondo la convenzione della lingua

## R14-class — Formattazione elenchi lunghi

**Scopo:** convertire elenchi inline troppo lunghi in bullet points per migliorare la leggibilita.

**Cosa verificare:**
- Elenchi con piu di 3-4 elementi con descrizioni estese vanno spezzati
- Threshold puo variare per lingua (lingue piu concise tollerano elenchi inline piu lunghi)

## R15-class — Contrazioni ed elisioni

**Scopo:** applicare le contrazioni/elisioni standard della lingua scritta.

**Cosa verificare:**
- Italiano: elisioni standard (l'asse, un'analisi, com'e)
- Inglese: contrazioni (don't, it's) in tono informale; evitare in tono formale
- Francese: elisioni obbligatorie (l'homme, j'ai, c'est)
- Tedesco: nessuna elisione standard nella scrittura formale

---

## Internazionalizzazione e Localizzazione (i18n/l10n)

### Modi di dire e espressioni idiomatiche

Quando il testo usa espressioni idiomatiche, verificare che:
- L'espressione esiste realmente nella lingua target (non e un calco)
- L'espressione e appropriata per il registro del libro
- Se il libro target ha un tono conversazionale, le espressioni colloquiali della lingua sono benvenute
- Se il tono e formale, evitare colloquialismi anche se grammaticalmente corretti

### Registro e formalita

I livelli di formalita variano per lingua e cultura:
- **Pronomi di cortesia:** tu/Lei/Voi (it), du/Sie (de), tu/vous (fr), tu/usted (es), you (en — neutro)
- **Scrittura tecnica:** ogni lingua ha una convenzione prevalente. Leggere book-config.md sezione Stile e Tono per il registro scelto

### Convenzioni culturali

- Esempi e metafore devono essere comprensibili nella cultura target
- Riferimenti sportivi, culinari o storici specifici di una cultura vanno adattati
- Unita di misura, valute e riferimenti temporali seguono le convenzioni locali

---

## Formato di output per la validazione

Per ogni violazione trovata:

```
[R#-class] Riga/passaggio: "testo originale"
  → Correzione: "testo corretto"
  → Regola: [breve descrizione della regola violata]
```

Al termine:

```
PUNTEGGIO DI CONFORMITA: __/100
CATEGORIE PIU VIOLATE: R#-class, R#-class, R#-class
RIEPILOGO: __ violazioni trovate su __ categorie diverse.
```

Scala: 95–100 eccellente, 85–94 buono, 70–84 sufficiente, 50–69 problematico, <50 da riscrivere.
