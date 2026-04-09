# Grammar & Style Rules — English Technical Writing

Rules for English-language technical books aimed at professionals. For each violation found, report the original passage, the rule violated, and the proposed correction.

## R1 — Technical term handling

Acronyms and abbreviations must be expanded at first use in each chapter, then used in short form.

- ✅ "Key Performance Indicators (KPIs) help teams... KPIs should be reviewed..."
- ❌ "KPIs help teams..." (first use without expansion)

**Exception:** universally known acronyms (API, URL, HTML, CSS) do not need expansion in technical books.

## R2 — Active voice preference

Prefer active voice in technical writing. Passive is acceptable for emphasis on the object or when the agent is unknown/irrelevant.

- ✅ "The team deployed the service" — ❌ "The service was deployed by the team"
- ✅ "The logs are rotated every 24 hours" (agent irrelevant — passive OK)

## R3 — Preposition correctness

Use idiomatic English prepositions; avoid common errors.

- ✅ "different from" — ❌ "different than" (formal)
- ✅ "comply with" — ❌ "comply to"
- ✅ "consists of" — ❌ "consists in"

## R4 — Subject-verb agreement

Ensure subject-verb agreement, especially with collective nouns, compound subjects, and technical terms.

- ✅ "The team is deploying" (British: "The team are deploying" also acceptable)
- ✅ "Neither the server nor the clients were responding"
- ❌ "The data shows" (formal: "The data show"; informal "data shows" is increasingly accepted)

## R5 — Article usage with technical terms

Use articles consistently with technical terms.

- ✅ "the API returns a JSON object"
- ❌ "API returns JSON object" (missing articles)

**Exception:** headings, labels, and bullet point fragments may omit articles.

## R6 — Number formatting (US/UK conventions)

- Decimal separator: period (3.14)
- Thousands separator: comma (1,000,000)
- Dates: Month DD, YYYY (US) or DD Month YYYY (UK) — be consistent throughout
- Currency: symbol before number ($100, £50, €75)
- Percentages: no space before % in US style (99.9%), space in some UK styles

**Exception:** code examples, URLs, version numbers follow their own conventions.

## R7 — Concise writing

Eliminate unnecessary words and prefer direct constructions.

- ✅ "to" — ❌ "in order to"
- ✅ "because" — ❌ "due to the fact that"
- ✅ "can" — ❌ "is able to"
- ✅ "now" — ❌ "at this point in time"

## R8 — Oxford comma

Use the Oxford (serial) comma in lists for clarity in technical writing.

- ✅ "logs, metrics, and traces"
- ❌ "logs, metrics and traces"

**Note:** the Oxford comma is recommended but not mandatory. Be consistent throughout the book.

## R9 — Semicolons for complex lists

When list items contain commas, use semicolons to separate items.

- ✅ "The system handles authentication, including OAuth; authorization, such as RBAC; and logging"
- ❌ "The system handles authentication, including OAuth, authorization, such as RBAC, and logging"

## R10 — Subjunctive mood

Use subjunctive in formal recommendations and conditions.

- ✅ "We recommend that the team review the logs" — ❌ "We recommend that the team reviews the logs"
- ✅ "If the server were to crash..." — ❌ "If the server was to crash..." (formal)

**Note:** subjunctive is optional in informal technical writing.

## R11 — Negation with alternatives

Use "neither...nor" for negative alternatives.

- ✅ "Neither the cache nor the database was updated"
- ❌ "The cache or the database was not updated"

## R12 — Heading conventions

Use sentence case for headings (capitalize only first word and proper nouns) unless the style guide specifies title case.

- ✅ "How to configure the deployment pipeline"
- Title case alternative: "How to Configure the Deployment Pipeline"

**Note:** be consistent throughout the book. Sentence case is the modern convention.

## R13 — Localization of UI terms

Keep UI terms, menu names, and button labels in the language of the software being described. If the book audience uses a localized version, use the localized terms.

- ✅ "Click **Settings** > **Advanced**" (English UI)
- ✅ "Fai clic su **Impostazioni** > **Avanzate**" (Italian UI, for Italian book)

## R14 — Long inline lists

When an inline list exceeds 3-4 items with descriptions, convert to a bulleted list.

**Inline acceptable** (short items): "Three steps: audit, assign owners, and test."

**Convert to list** (long items): lists with more than 3 items, each requiring a sentence of explanation.

## R15 — Contractions

Use contractions (don't, it's, can't) in conversational-expert tone. Avoid in formal/academic tone.

- Conversational: "You don't need to restart the server"
- Formal: "You do not need to restart the server"

**Consistency:** match the tone defined in book-config.md. Do not mix contracted and uncontracted forms.

---

## Output format for validation

For each violation found:

```
[R#] Line/passage: "original text"
  → Correction: "corrected text"
```

Summary:

```
CONFORMITY SCORE: __/100
MOST VIOLATED RULES: R__, R__, R__
SUMMARY: __ violations found across __ different rules.
```

Scale: 95–100 excellent, 85–94 good, 70–84 acceptable, 50–69 problematic, <50 needs rewriting.
