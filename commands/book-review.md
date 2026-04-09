---
description: Revisione editoriale completa di un capitolo
allowed-tools: Read, Grep, Glob, Write, Edit, Bash(git:*)
argument-hint: [file-capitolo.md]
---

Esegui una revisione editoriale completa del capitolo in @$1.

**Step 0: Configurazione lingua e stile**

Leggere `book-config.md` nella root del progetto per determinare:
- **Lingua** → quale language pack grammaticale caricare
- **Piattaforma** → quali regole di formattazione applicare
- **Stile e Tono** → tono target, registro, rapporto teoria/pratica

Caricare le skill di riferimento:
- `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/SKILL.md` per il TOV e lo stile
- Regole grammaticali: `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/references/{lang}/grammar-rules.md` (dove {lang} è la lingua da book-config.md). Se il pack non esiste, usare `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/references/grammar-framework.md`
- `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/references/scorecard.md` per la scorecard
- `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/references/editorial-principles.md` per i principi editoriali (King, Zinsser, Strunk & White, Lamott)
- Se piattaforma è LeanPub/Markua: `${CLAUDE_PLUGIN_ROOT}/skills/markua-leanpub/SKILL.md` per le regole formato

Eseguire nell'ordine:

**1. Scorecard di qualità (7 dimensioni, punteggio 0–10 ciascuna)**
Compilare la scorecard completa. Obiettivo: >= 60/70.

**2. Validazione grammaticale e stilistica**
Verificare il capitolo contro le regole del language pack della lingua configurata. Per ogni violazione:
```
[R#] Riga/passaggio: "testo originale"
  → Correzione: "testo corretto"
```
Generare correzioni con modi di dire e espressioni idiomatiche naturali della lingua target.
Concludere con punteggio di conformità /100.

**3. Validazione formato**
Se la piattaforma è LeanPub/Markua: controllare tutti gli elementi formali (epigrafe, separatore, sezioni, pagebreak, callout, Quick Win, Checkpoint). Se altra piattaforma: applicare best practice Markdown generiche.

**4. Check contenuto**
- Rapporto teoria/pratica (target da book-config.md, default 30/70)
- Prosa vs elenchi puntati (segnalare elenchi narrativi da convertire)
- Tono coerente con quello configurato (segnalare passaggi che deviano)
- Benchmark quantitativi (adattati alla lingua e al tono)

**5. Riepilogo finale**
Presentare (nella lingua del libro):
- Scorecard compilata
- Punteggio conformità grammaticale /100
- Top 5 interventi prioritari con riga e proposta di correzione
- Giudizio complessivo: pronto per pubblicazione / necessita revisione mirata / necessita revisione approfondita

## Git commit

Se sono state applicate correzioni al testo e ci si trova in un repository git (`git rev-parse --is-inside-work-tree 2>/dev/null`), eseguire:

```bash
git add * && git commit -m "book-review: editorial review [nome-file] — scorecard [punteggio]/70, grammar [punteggio]/100"
```

Se non ci si trova in un repository git, non fare nulla.
