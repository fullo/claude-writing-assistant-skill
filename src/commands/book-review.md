---
description: Revisione editoriale completa di un capitolo
allowed-tools: Read, Grep, Glob, Write, Edit, Bash(git:*)
argument-hint: [file-capitolo.md]
---

Esegui una revisione editoriale completa del capitolo in @$1.

Prima di iniziare, leggere le skill di riferimento:
- `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/SKILL.md` per il TOV e lo stile
- `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/references/italian-rules.md` per le 15 regole italiane
- `${CLAUDE_PLUGIN_ROOT}/skills/tov-style/references/scorecard.md` per la scorecard
- `${CLAUDE_PLUGIN_ROOT}/skills/markua-leanpub/SKILL.md` per le regole Markua

Eseguire nell'ordine:

**1. Scorecard di qualità (7 dimensioni, punteggio 0–10 ciascuna)**
Compilare la scorecard completa. Obiettivo: ≥ 60/70.

**2. Validazione stilistica italiana (15 regole)**
Verificare il capitolo contro tutte le 15 regole di `italian-rules.md`. Per ogni violazione:
```
[R#] Riga/passaggio: "testo originale"
  → Correzione: "testo corretto"
```
Concludere con punteggio di conformità /100.

**3. Validazione Markua**
Controllare tutti gli elementi formali: epigrafe, separatore, sezioni, pagebreak, callout, Quick Win, Checkpoint. Segnalare ogni deviazione dal formato canonico.

**4. Check contenuto**
- Rapporto teoria/pratica (target 30/70)
- Prosa vs elenchi puntati (segnalare elenchi narrativi da convertire)
- Tono conversazionale-esperto (segnalare passaggi presupponenti o accademici)
- Benchmark quantitativi (marcatori colloquiali, cross-reference, ecc.)

**5. Riepilogo finale**
Presentare:
- Scorecard compilata
- Punteggio conformità italiana /100
- Top 5 interventi prioritari con riga e proposta di correzione
- Giudizio complessivo: pronto per pubblicazione / necessita revisione mirata / necessita revisione approfondita

## Git commit

Se sono state applicate correzioni al testo e ci si trova in un repository git (`git rev-parse --is-inside-work-tree 2>/dev/null`), eseguire:

```bash
git add * && git commit -m "book-review: revisione editoriale [nome-file] — scorecard [punteggio]/70, conformità [punteggio]/100"
```

Se non ci si trova in un repository git, non fare nulla.
