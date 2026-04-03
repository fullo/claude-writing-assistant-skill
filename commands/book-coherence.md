---
description: Verifica coerenza tra capitoli o tra libri
allowed-tools: Read, Grep, Glob, Write, Edit, Bash(git:*)
argument-hint: [directory-libro o due directory per confronto inter-libro]
---

Verifica la coerenza narrativa e strutturale del libro o tra libri.

Prima leggere:
- `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/SKILL.md`
- `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/references/coherence-checklist.md`
- `${CLAUDE_PLUGIN_ROOT}/skills/book-coherence/references/cross-reference.md` (regole e template mappa cross-reference)

**Se viene fornita una singola directory** (un progetto libro) → coerenza intra-libro.
**Se vengono fornite due directory** (due progetti libro) → coerenza intra-libro per ciascuna + coerenza inter-libro.

## Struttura progetto attesa

```
libri/                             ← root serie
├── cross-reference.md             ← mappa cross-reference (livello serie, generato)
├── nome-libro/
│   ├── capitoli/                  ← manuscript LeanPub, contiene book.txt e i .md
│   ├── fonti/
│   ├── assets/
│   └── book-config.md             ← metadati: personaggi, timeline, terminologia
└── altro-libro/
    └── ...
```

## Coerenza intra-libro

1. **Leggere `book-config.md`** (se presente) per: personaggi attesi, timeline master, framework centrale, terminologia canonica. Usare questi dati come riferimento per tutti i check successivi.
2. Leggere `capitoli/book.txt` per l'ordine dei capitoli.
2. Per ogni capitolo, estrarre:
   - Periodo temporale del caso studio
   - Numeri: revenue, metriche, headcount, percentuali
   - Personaggi: nome, ruolo, posizioni espresse
   - Cross-reference: "(vedi Capitolo N)" e simili
   - Framework centrale: dove è menzionato, con quali termini

3. Verificare:
   - Timeline monotonicamente crescente
   - Numeri coerenti tra capitoli
   - Personaggi consistenti (nome, ruolo, caratterizzazione)
   - Cross-reference che puntano a capitoli corretti
   - Framework centrale con linguaggio coerente
   - Nessun concetto rispiegato (dovrebbe avere cross-reference)

4. Verificare struttura obbligatoria per ogni capitolo:
   - Epigrafe, Hook, Quick Win, Checkpoint presenti
   - Fine Parte per capitoli di chiusura

5. Compilare matrice distribuzione callout.

## Coerenza inter-libro (se due directory)

0. **Leggere `cross-reference.md`** nella directory padre (livello serie), se presente, come base di partenza. Se assente, verrà generato al termine.
1. Identificare concetti che compaiono in entrambi i volumi.
2. Verificare terminologia identica per concetti condivisi.
3. Scansionare tutti i capitoli con i pattern regex definiti in `references/cross-reference.md` (sezione 1.1) per trovare tutti i rimandi cross-volume.
4. Per ogni rimando trovato:
   - Classificare il tipo (A/B/C/D) secondo sezione 1.4
   - Verificare i vincoli V1–V8 secondo sezione 1.3
   - Verificare il formato canonico secondo sezione 1.2
5. Se caso studio condiviso: estrarre e confrontare dati fattuali (nomi, ruoli, timeline, numeri).
6. Verificare formattazione callout identica.
7. **Generare/aggiornare `cross-reference.md`** nella directory padre (livello serie) seguendo il template della Parte 2 di `references/cross-reference.md`: intestazione, registro rimandi, concetti condivisi, caso studio condiviso, problemi aperti.

## Output

```
COERENZA INTRA-LIBRO: [nome libro]
====================================

Timeline: X incongruenze trovate
  - [Cap N vs Cap M] ...

Numeri: X incongruenze trovate
  - [Cap N, ~riga XX] ...

Personaggi: X incongruenze trovate
  - ...

Cross-reference: X problemi trovati
  - ...

Framework: X problemi trovati
  - ...

Struttura: X elementi mancanti
  - ...

Distribuzione callout:
  | Elemento | Cap 2 | Cap 3 | ... |
  | ...      | ...   | ...   | ... |

COERENZA INTER-LIBRO (se applicabile)
======================================

Cross-reference inter-volume: X trovati
  - [#1] Volume A Cap. N → Volume B Cap. M (Tipo A) ✅
  - [#2] Volume A Cap. N → Volume B Cap. M (Tipo C) ⚠️ formato non canonico
  - ...

Concetti condivisi: X verificati, Y incoerenti
  - ...

Caso studio condiviso: X dati confrontati, Y incoerenti
  - ...

RIEPILOGO: X problemi critici, Y avvertimenti
AZIONI PRIORITARIE:
1. ...
2. ...
3. ...

AGGIORNAMENTO MAPPA: cross-reference.md aggiornato nella root serie
```

## Git commit

Se sono state applicate correzioni di coerenza e ci si trova in un repository git (`git rev-parse --is-inside-work-tree 2>/dev/null`), eseguire:

```bash
git add * && git commit -m "book-coherence: fix [N] problemi coerenza — [breve descrizione interventi principali]"
```

Se non ci si trova in un repository git o non sono state applicate correzioni (solo analisi), non fare nulla.
