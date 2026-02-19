# Guida Markua Completa — Regole e Audit di Coerenza

## 1. Regole dettagliate con varianti da evitare

### 1.1 Titolo del capitolo

```markua
# Capitolo N: Titolo — Sottotitolo
```

Formato: `#` H1, numero + titolo + trattino lungo (—) + sottotitolo descrittivo.

### 1.2 Epigrafe (citazione di apertura)

```markua
> "Citazione in inglese."
>
> — **Nome Autore**
```

**Varianti da segnalare come errore:**
- Attribuzione su 3 righe (nota + autore su righe separate)
- Spazio extra `> ` (doppio spazio)
- Citazione in corsivo `*"..."*` invece di solo virgolette

**Formato canonico:** virgolette senza corsivo, autore su singola riga, nessuna nota inline.

### 1.3 Separatore post-epigrafe

```markua
---
```

Sempre presente dopo ogni epigrafe. Nessuna eccezione.

### 1.4 Sezioni

```markua
## N.M Titolo della sezione — Sottotitolo opzionale
```

**Varianti da segnalare come errore:**
- Uso di `-` (trattino corto) invece di `—` (trattino lungo)

### 1.5 Sotto-sezioni

```markua
### Titolo della sotto-sezione
```

Senza numerazione. H3.

### 1.6 Pagebreak

```markua
---

{pagebreak}

## N.M Titolo
```

Prima di ogni nuova sezione `##` tranne la prima del capitolo. Separato da `---` sopra e riga vuota sotto.

### 1.7 Insight (box informativo)

```markua
T> **Insight**
T>
T> Testo dell'insight su una o più righe. Ogni riga
T> inizia con T> seguito da spazio.
```

**Labels ammesse:** `**Insight**`, `**Regola pratica**`, `**Approfondimento**`

**Varianti da segnalare come errore:**
- `T> **Nota**` → convertire in `**Approfondimento**`
- `T> **💡 Insight: sottotitolo**` → rimuovere emoji e sottotitolo
- `T> **Insight: sottotitolo**` → rimuovere sottotitolo dalla label
- `T> **Esempio pratico:**` → estrarre in testo libero con `###`

### 1.8 Red Flag (avvertimento)

```markua
W> **Red Flag**
W>
W> Testo dell'avvertimento.
```

**Varianti da segnalare come errore:**
- `W> **Red flag**` → f minuscola, correggere in F maiuscola
- `W> **Red flags:**` → singolare, senza due punti
- `W> **Red flag: sottotitolo**` → rimuovere sottotitolo dalla label
- Qualsiasi label diversa da `**Red Flag**` → normalizzare

### 1.9 Domanda Socratica

```markua
Q> **Domanda Socratica**
Q>
Q> Testo della domanda, tipicamente 2–4 righe.
Q>
Q> Eventuale secondo paragrafo riflessivo.
```

**Varianti da segnalare come errore:**
- `Q> **🤔 Domanda Socratica**` → rimuovere emoji

### 1.10 Quick Win (blurb)

```markua
{blurb, icon: trophy}
**Quick Win: Titolo dell'esercizio rapido**

Contenuto dell'esercizio su più righe.
Può includere step numerati, domande, checklist.

{/blurb}
```

**Varianti da segnalare come errore:**
- `**🎯 Quick Win: ...**` → rimuovere emoji
- `## Quick Win: ...` → convertire H2 in bold
- Quick Win senza wrapper `{blurb}` → wrappare

### 1.11 Checkpoint di fine capitolo

```markua
## Checkpoint capitolo N

Frase introduttiva.

### Su [argomento]:

Frase contestuale.

- [ ] Domanda di verifica 1?
- [ ] Domanda di verifica 2?
- [ ] Domanda di verifica 3?
```

**Errori da segnalare:**
- Checkpoint assente
- Checkpoint senza checkbox
- Meno di 3 checkbox per sotto-sezione

### 1.12 Chiusura di Parte

```markua
## Fine Parte N — Nome
```

Sempre H2. Mai bold `**...**`. Trattino lungo (—).

### 1.13 Tabelle

Formato Markdown standard. Allineamento: `:---` sinistra, `:---:` centro, `---:` destra.

### 1.14 Blocchi di codice

Senza language tag. Larghezza max ~50 caratteri per compatibilità stampa.

### 1.15 Formattazione OKR inline

```markua
**O:** Testo dell'obiettivo

**KR1:** Testo del key result
**KR2:** Testo del key result
**KR3:** Testo del key result
```

Label in bold, contenuto sulla stessa riga. Riga vuota tra O e KR1.

## 2. Checklist di validazione rapida per capitolo

- [ ] H1 unico con formato `# Capitolo N: Titolo — Sottotitolo`
- [ ] Epigrafe con virgolette (no corsivo), attribuzione su singola riga
- [ ] `---` dopo epigrafe
- [ ] Sezioni `##` con numerazione N.M e trattino lungo (—)
- [ ] `{pagebreak}` prima di ogni `##` (tranne la prima)
- [ ] Callout T> con label ammesse, senza emoji
- [ ] Callout W> con `**Red Flag**` (F maiuscola)
- [ ] Callout Q> senza emoji
- [ ] Quick Win in `{blurb, icon: trophy}` con bold (non H2)
- [ ] Checkpoint con `##`, sotto-sezioni `###`, almeno 3 checkbox ciascuna
- [ ] Fine Parte come `##` (non bold), se applicabile
- [ ] Nessuna emoji in label o titoli
- [ ] Sentence case su tutti i titoli
- [ ] Trattino lungo (—) ovunque, mai trattino corto (-) nei titoli
