# Writing Assistant - Claude Code Plugin

[![Skill Version](https://img.shields.io/badge/skill-v1.0-blue)](skills/tov-style/SKILL.md)
[![Skills](https://img.shields.io/badge/skills-3-green)](skills/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/format-agentskills.io-purple)](https://agentskills.io/)

Assistente editoriale per la scrittura di libri tecnici: controllo TOV e stile italiano, formattazione Markua/LeanPub, coerenza narrativa multi-libro.

## Skills

- **tov-style** - Controllo tono di voce, grammatica italiana, stile editoriale
- **markua-leanpub** - Validazione formato Markua, preparazione per LeanPub
- **book-coherence** - Coerenza narrativa, cross-reference tra capitoli e libri

## Installazione

### Come plugin Claude Code

```bash
git clone https://github.com/fullo/claude-writing-assistant-skill.git
claude plugin add /path/to/claude-writing-assistant-skill
```

### Come Agent Skill standalone

Copia la directory skills/ nella tua directory .claude/skills/:

```bash
git clone https://github.com/fullo/claude-writing-assistant-skill.git
cp -r claude-writing-assistant-skill/skills/* .claude/skills/
```

## Struttura

```
writing-assistant/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── tov-style/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   └── evals/
│   ├── markua-leanpub/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   └── evals/
│   └── book-coherence/
│       ├── SKILL.md
│       ├── references/
│       └── evals/
├── agents/
├── commands/
├── hooks/
├── LICENSE
└── README.md
```

## Compatibilita

Segue il formato Agent Skills (agentskills.io) e funziona con Claude Code, Cursor, Windsurf, Cline e altri agent compatibili.

## Licenza

MIT
