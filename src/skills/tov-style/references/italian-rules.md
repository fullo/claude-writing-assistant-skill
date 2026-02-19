# Le 15 Regole di Validazione Stilistica — Italiano Tecnico-Divulgativo

Queste regole si applicano a testi italiani tecnico-divulgativi destinati a professionisti, contenenti termini tecnici inglesi. Per ogni violazione trovata, segnalare il passaggio originale, la regola violata e la correzione proposta.

## R1 — Italiano primario, inglese di supporto

I termini tecnici inglesi vanno tradotti in italiano come forma primaria. L'inglese compare in corsivo tra parentesi, solo alla prima occorrenza nel capitolo. Nelle occorrenze successive si usa solo il termine italiano.

- ✅ Causalità invertita (*reverse causality*)
- ✅ Variabile confondente (*confounding variable*)
- ❌ Reverse causality — potrebbe essere Y a causare X?
- ❌ Variabile nascosta (confounding variable) [senza corsivo]

**Eccezione:** termini senza traduzione italiana consolidata e cercabile (es. "deployment", "churn rate", "sprint") restano in inglese senza traduzione forzata.

## R2 — Forme verbali italiane idiomatiche

Non ricalcare la sintassi inglese. Preferire costruzioni naturali in italiano.

- ✅ "potrebbe essere Y a causare X" — ❌ "potrebbe essere Y che causa X"
- ✅ "pensando che determini Y" — ❌ "pensando determini Y"
- ✅ "sono queste pratiche a ridurre i bug" — ❌ "sono queste pratiche che riducono i bug"

## R3 — Preposizioni corrette

Usare la preposizione italiana idiomatica, non quella ricalcata dall'inglese.

- ✅ "associato a" — ❌ "associato con"
- ✅ "programmati a vedere" — ❌ "programmati per vedere"
- ✅ "allineare gli incentivi ai KPI" — ❌ "allineare gli incentivi con i KPI"
- ✅ "cultura in cui i dati servono a imparare" — ❌ "cultura dove i dati servono per imparare"

## R4 — Concordanza di genere con anglicismi

Gli anglicismi hanno un genere grammaticale in italiano. Rispettarlo sempre.

| Termine | Genere | Esempio corretto |
| :--- | :--- | :--- |
| dashboard | femminile | la dashboard, dashboard operativa |
| pipeline | femminile | la pipeline, pipeline generata |
| review | femminile | la review, code review rigorosa |
| feature | femminile | la feature, le feature avanzate |
| performance | femminile | la performance |
| startup | femminile | la startup |
| keyword | femminile | la keyword |

## R5 — Articoli prima di anglicismi

Non omettere mai l'articolo determinativo o indeterminativo davanti a un anglicismo usato come sostantivo.

- ✅ "confonde gli utenti non-tech" — ❌ "confonde utenti non-tech"
- ✅ "coinvolgere gli stakeholder" — ❌ "coinvolgere stakeholder"

## R6 — Numeri decimali in formato italiano

Usare la virgola come separatore decimale, non il punto.

- ✅ "1,5 email/settimana" — ❌ "1.5 email/settimana"
- ✅ "uptime 99,9%" — ❌ "uptime 99.9%"

**Eccezione:** numeri parte di nomi propri, codici, URL o formule (es. "Python 3.11", "p-value 0.003").

## R7 — Semplificazione lessicale

Preferire forme brevi e dirette.

- ✅ "in silenzio" — ❌ "silenziosamente"
- ✅ "cross-funzionali" — ❌ "cross-functional"
- ✅ "senza approvazioni" — ❌ "zero approvazioni"
- ✅ "per verificare" — ❌ "per capire" (quando il contesto richiede precisione)

## R8 — Articoli determinativi obbligatori

Non omettere mai l'articolo determinativo prima di un sostantivo, anche in passaggi operativi.

- ✅ "fare l'inventario completo e la pulizia" — ❌ "fare inventario completo e pulizia"
- ✅ "coprire i gap e coinvolgere gli stakeholder" — ❌ "coprire gap e coinvolgere stakeholder"
- ✅ "lista dei gap identificati" — ❌ "lista gap identificati"

## R9 — Punto e virgola per elenchi inline di frasi complete

Quando un elenco inline contiene elementi con soggetto e verbo propri, usare il punto e virgola.

- ✅ "La differenza è chiara; i 4 Cavalieri sono familiari; le metriche sono state classificate"
- ❌ "La differenza è chiara, i 4 Cavalieri sono familiari, le metriche sono state classificate"

La virgola resta corretta per elenchi di parole singole o sintagmi brevi senza verbo.

## R10 — Congiuntivo nelle subordinate

Usare il congiuntivo nelle subordinate che esprimono finalità, ipotesi, giudizio indiretto, dubbio o desiderio.

- ✅ "Servono KPI che riflettano la nuova realtà" — ❌ "Servono KPI che riflettono la nuova realtà"
- ✅ "Non stiamo dicendo che fossero sbagliati" — ❌ "Non stiamo dicendo che erano sbagliati"

## R11 — "Né" nelle negazioni

In costruzioni negative con elenco, usare "né" al posto di "o".

- ✅ "Non richiedono approvazioni, budget né meeting"
- ❌ "Non richiedono approvazioni, budget o meeting"

## R12 — Niente virgola Oxford

In italiano, non inserire la virgola prima dell'ultimo elemento di un elenco coordinato da "o"/"e".

- ✅ "'il team', 'non lo so' o 'dipende'"
- ❌ "'il team', 'non lo so', o 'dipende'"

## R13 — Italianizzazione di heading e termini UI

I termini che fungono da etichette, titoli di sezione o nomi di step vanno in italiano quando esiste una traduzione naturale.

- ✅ "Richiesta esplicita" — ❌ "Ask esplicito"
- ✅ "Bias di selezione, *selection bias*" — ❌ "Selection bias"
- ✅ "allineamento cross-funzionale" — ❌ "cross-functional alignment"

## R14 — Elenchi lunghi inline → bullet points

Quando un elenco inline supera i 3–4 elementi e ciascuno ha una descrizione di almeno una frase, spezzarlo in bullet points.

**Inline accettabile** (elementi brevi): "Tre step: audit zombie, assegnare owner, test So What."

**Da convertire in lista** (elementi lunghi con descrizione): elenchi con più di 3 item, ciascuno con soggetto + verbo + spiegazione.

## R15 — Elisioni standard

Applicare le elisioni normali dell'italiano scritto.

- ✅ "com'è noto" — ❌ "come è noto"
- ✅ "un'analisi" — ❌ "una analisi"
- ✅ "l'asse" — ❌ "lo asse"

## Formato di output per la validazione

Per ogni violazione trovata:

```
[R#] Riga/passaggio: "testo originale"
  → Correzione: "testo corretto"
```

Al termine:

```
PUNTEGGIO DI CONFORMITÀ: __/100
REGOLE PIÙ VIOLATE: R__, R__, R__
RIEPILOGO: __ violazioni trovate su __ regole diverse.
```

**Scala:** 95–100 eccellente, 85–94 buono, 70–84 sufficiente, 50–69 problematico, <50 da riscrivere.
