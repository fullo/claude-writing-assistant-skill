# Writing Assistant - Claude Code Plugin

[![Skill Version](https://img.shields.io/badge/skill-v2.0-blue)](skills/tov-style/SKILL.md)
[![Skills](https://img.shields.io/badge/skills-3-green)](skills/)
[![Agents](https://img.shields.io/badge/agents-3-orange)](agents/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/format-agentskills.io-purple)](https://agentskills.io/)

Editorial assistant for book writing — language-aware TOV/style checking, format validation, multi-book coherence, and optional adversarial editorial challenge.

## Features

- **Multi-language support** — grammar and style rules adapt to the book's language (Italian and English packs included, extensible to any language)
- **Format-aware** — detailed Markua/LeanPub validation (default), generic Markdown for other platforms
- **Series-agnostic** — works with any book series or standalone books
- **Adversarial review** — optional agents for critical thinking challenge and premise-product verification

## Skills

- **tov-style** - Tone of voice, grammar, editorial style (language-aware)
- **markua-leanpub** - Markua format validation, LeanPub publishing
- **book-coherence** - Narrative coherence, cross-references across chapters and books

## Agents

- **book-reviewer** - Complete editorial audit (scorecard, grammar, format, coherence)
- **book-challenger** - Adversarial thinking challenge for editorial choices (requires `adversarial-thinking@fullo-plugins`)
- **book-verifier** - Chain-of-Verification for premise-product alignment (requires `adversarial-verify@fullo-plugins`)

## Commands

- `/book-init [name]` - Scaffold a new book project
- `/book-status` - Generate book status overview
- `/book-review [file]` - Full editorial review of a chapter
- `/book-coherence [dir]` - Check narrative coherence
- `/book-markua [file]` - Validate Markua formatting
- `/book-source [file|url]` - Manage reference sources

## Configuration

Each book project uses a `book-config.md` file as the single source of truth:

- **Lingua** — determines which grammar rules to apply (language pack)
- **Piattaforma** — determines formatting rules (LeanPub/Markua, GitBook, etc.)
- **Stile e Tono** — tone, register, narrative pattern, forbidden terms
- **Serie** — series name for cross-book coherence (optional)

Run `/book-init` to create a new project with the full template.

## Language Packs

Grammar rules are organized by language in `skills/tov-style/references/`:

```
references/
  grammar-framework.md    <- Generic framework (all languages)
  it/
    grammar-rules.md      <- Italian: 15 detailed rules
    style-guide.md        <- Italian: complete style guide
  en/
    grammar-rules.md      <- English: 15 rules (starter pack)
  scorecard.md            <- Quality scorecard (language-agnostic)
```

For languages without a dedicated pack, the generic framework guides the AI to generate appropriate checks.

### Adding a language pack

Create `references/{lang-code}/grammar-rules.md` following the structure of existing packs. Use `grammar-framework.md` as a guide for the 15 rule categories.

## Adversarial Review (Optional)

Install `adversarial-thinking@fullo-plugins` to enable two additional agents:

- **book-challenger** — challenges your narrative choices using Socratic method and cognitive forcing techniques
- **book-verifier** — verifies alignment between your book's stated premises (in book-config.md) and actual content using Chain-of-Verification

These agents are detected automatically. Without the plugin, they use a lightweight embedded version.

## Installation

### As Claude Code plugin

```bash
git clone https://github.com/fullo/claude-writing-assistant-skill.git
claude plugin add /path/to/claude-writing-assistant-skill
```

### As Agent Skill standalone

```bash
git clone https://github.com/fullo/claude-writing-assistant-skill.git
cp -r claude-writing-assistant-skill/skills/* .claude/skills/
```

## Structure

```
writing-assistant/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── tov-style/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── grammar-framework.md
│   │   │   ├── scorecard.md
│   │   │   ├── it/grammar-rules.md, style-guide.md
│   │   │   └── en/grammar-rules.md
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
│   ├── book-reviewer.md
│   ├── book-challenger.md
│   └── book-verifier.md
├── commands/
├── hooks/
├── LICENSE
└── README.md
```

## Compatibility

Follows the Agent Skills format (agentskills.io) and works with Claude Code, Cursor, Windsurf, Cline and other compatible agents.

## License

MIT
