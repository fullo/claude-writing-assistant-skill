---
name: markua-leanpub
description: >
  Questa skill va usata quando l'utente chiede di "verificare il formato Markua",
  "controllare la formattazione LeanPub", "validare i callout", "controllare i pagebreak",
  "audit Markua", "formattare il capitolo", "fix formatting", "check blurb",
  oppure quando si scrive o modifica un file .md destinato a LeanPub.
version: 0.1.0
---

# Formato Markua — Regole di Formattazione LeanPub

Skill di riferimento per il dialetto Markua di Markdown usato su LeanPub. Tutte le regole sono definitive e fisse (non configurabili). Si applicano a capitoli e appendici.

## Formati canonici — Riepilogo rapido

```
TITOLO:          # Capitolo N: Titolo — Sottotitolo
EPIGRAFE:        > "Citazione."  >  > — **Autore**
SEPARATORE:      ---  (sempre dopo epigrafe)
SEZIONE:         ## N.M Titolo — Sottotitolo
SOTTO-SEZIONE:   ### Titolo (senza numerazione)
PAGEBREAK:       {pagebreak}  (prima di ogni ## tranne la prima)
INSIGHT:         T> **Insight**  T>  T> testo
RED FLAG:        W> **Red Flag**  (F maiuscola)
SOCRATICA:       Q> **Domanda Socratica**  (senza emoji)
QUICK WIN:       {blurb, icon: trophy}  **Quick Win: Titolo**  {/blurb}
CHECKPOINT:      ## Checkpoint capitolo N  (con checkbox - [ ])
FINE PARTE:      ## Fine Parte N — Nome
OKR INLINE:      **O:** testo  **KR1:** testo
TABELLE:         | col | col |  standard Markdown
CODE BLOCK:      ``` senza language tag
```

## Regole dettagliate

### Titolo del capitolo
`# Capitolo N: Titolo — Sottotitolo` — H1, numero + titolo + trattino lungo (—) + sottotitolo descrittivo. Unico H1 per file.

### Epigrafe
Blockquote standard. Citazione tra virgolette (senza corsivo), riga vuota `>`, attribuzione con trattino lungo e nome in bold su singola riga. Nessuna nota inline.

### Separatore post-epigrafe
`---` sempre presente dopo ogni epigrafe. Nessuna eccezione.

### Sezioni
`## N.M Titolo — Sottotitolo` — H2 con numerazione Capitolo.Sezione. Sottotitolo separato da trattino lungo (—). Mai trattino corto (-).

### Sotto-sezioni
`### Titolo` — H3 senza numerazione.

### Pagebreak
`{pagebreak}` prima di ogni nuova sezione `##` (tranne la prima del capitolo). Pattern:

```
---

{pagebreak}

## N.M Titolo
```

### Callout — Insight
Prefisso `T>`. Label: `**Insight**` in bold. Riga vuota `T>` dopo la label. Labels alternative ammesse: `**Regola pratica**`, `**Approfondimento**`. Nessuna emoji, nessun sottotitolo nella label.

### Callout — Red Flag
Prefisso `W>`. Label: `**Red Flag**` con F maiuscola. Nessun sottotitolo nella label.

### Callout — Domanda Socratica
Prefisso `Q>`. Label: `**Domanda Socratica**` senza emoji.

### Quick Win
Tag `{blurb, icon: trophy}`. Label `**Quick Win: Titolo**` in bold (non `##`). Sempre prima del Checkpoint. Chiuso con `{/blurb}`.

### Checkpoint
`## Checkpoint capitolo N`. Sotto-sezioni `###` tematiche con almeno 3 checkbox `- [ ]` ciascuna.

### Chiusura di Parte
`## Fine Parte N — Nome` — sempre H2, mai bold.

### Tabelle
Markdown standard con allineamento: `:---` sinistra, `:---:` centro, `---:` destra.

### Blocchi di codice
Senza language tag. Larghezza max raccomandata: ~50 caratteri per compatibilità stampa.

### Formattazione OKR inline
`**O:**` testo obiettivo, riga vuota, `**KR1:**` testo key result. Label in bold, contenuto sulla stessa riga.

## Regole universali

- **Nessuna emoji** in callout, titoli o label.
- **Sentence case** per tutti i titoli.
- **Trattino lungo (—)** ovunque, mai trattino corto (-) nei titoli/sottotitoli.
- Tutti i callout seguono il pattern: label in bold → riga vuota con prefisso → contenuto.

## Risorse dettagliate

Per l'audit completo capitolo per capitolo e tutte le varianti trovate: **`references/markua-rules.md`**
