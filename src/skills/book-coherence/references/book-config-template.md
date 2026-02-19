# Book Config — Template

Questo file va creato nella root di ogni progetto libro come `book-config.md`. Il plugin lo usa come riferimento per i check automatici di coerenza, terminologia e struttura.

## Formato

```markdown
# Book Config — [Titolo del libro]

## Metadati

- **Titolo completo:** [titolo]
- **Serie:** the Right Way
- **Autore:** Francesco Fullone — Daruma Consulting
- **Stato:** bozza | revisione | pronto
- **Lingua:** italiano
- **Piattaforma:** LeanPub (Markua)

## Struttura

- **Parti:** N
  - Parte I: [Nome] (Cap N–M)
  - Parte II: [Nome] (Cap N–M)
  - ...
- **Capitoli totali:** N
- **Appendici:** N

## Framework centrale

- **Nome:** [es. Framework della causalità]
- **Capitolo di introduzione:** Cap N
- **Definizione sintetica:** [1–2 frasi]
- **Termini canonici:** [elenco dei termini specifici del framework]
- **Capitoli dove deve essere presente:** Cap N, M, P, ...

## Caso studio

- **Nome azienda:** [es. Karma Inc.]
- **Periodo coperto:** [es. Gennaio 2023 — Giugno 2024]
- **Settore:** [es. SaaS B2B]

### Personaggi

| Nome | Ruolo | Tratti chiave |
| :--- | :--- | :--- |
| [Nome] | [Ruolo] | [2–3 tratti] |
| [Nome] | [Ruolo] | [2–3 tratti] |

### Timeline master

| Periodo | Capitolo | Eventi chiave | Metriche |
| :--- | :--- | :--- | :--- |
| Gen 2023 | Cap 2 | Kick-off OKR | Revenue: €XXk, Team: N |
| Mar 2023 | Cap 3 | Primo trimestre | Revenue: €XXk, Team: N |
| ... | ... | ... | ... |

## Terminologia di dominio

### Termini tecnici da non tradurre
[elenco: OKR, KPI, Key Result, ...]

### Acronimi (con definizione alla prima occorrenza)
| Acronimo | Significato |
| :--- | :--- |
| OKR | Objectives and Key Results |
| ... | ... |

### Termini potenzialmente confusi (sinonimi da evitare)
| Termine canonico | Da non usare |
| :--- | :--- |
| [termine] | [sinonimo da evitare] |

## Esercizi

| # | Capitolo | Tipo | Materiali |
| :--- | :--- | :--- | :--- |
| 1 | Cap N | [classificazione/scrittura/simulazione] | [carte JSON / template / Miro] |
| ... | ... | ... | ... |

## Mappa cross-volume

| Concetto | Questo libro | Altro volume | Note |
| :--- | :--- | :--- | :--- |
| [concetto] | Cap N (approfondito) | [Titolo], Cap M | [come si collega] |
| ... | ... | ... | ... |
```

## Note sull'uso

- Il file viene creato da `/init-book` con struttura vuota da compilare
- Il file viene letto da `/check-coherence` per verificare automaticamente timeline, personaggi, numeri, terminologia
- Il file viene consultato dall'agent `book-reviewer` durante gli audit completi
- Le sezioni possono essere aggiornate incrementalmente man mano che il libro cresce
