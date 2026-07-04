# Document frontmatter

The YAML header shape for indexed Markdown work documents. A reference the `tree-graph-filesystem` and `tracking-progress` surfaces lean on; non-normative here. The applicable convention or tool owns *which* work documents need frontmatter.

## Purpose

Frontmatter makes a Markdown work document self-describing enough for generated indexes. It is a digest, not the document: keep only fields used for indexing, report status, or graph traversal. The document path remains the identity.

This reference is for [`work documents`](../references/work-documents.md) only. Conventions, references, templates, and skills are out of scope unless a later generated index admits them explicitly. Skills already carry tool-owned frontmatter for the Codex skill loader; do not mix that contract with this one.

## Core fields

These are the small common fields an indexed document should expose:

- **`kind`** - the document role from the work-document vocabulary.
- **`name`** - the human identity shown in indexes.
- **`status`** - the document's indexable state, using the vocabulary owned by that document kind.
- **`description`** - one sentence carrying the gist an index should show, so tools do not scrape the opening paragraph.

## Field formats

- **`kind`** - lowercase token. Initial accepted values: `scheme`, `effort`, `plan`, `log`, `report`, `index`, `jobs`, `discussions`.
- **`name`** - short human label, stable enough for an index row; not a path and not a separate ID.
- **`status`** - lowercase token from the vocabulary for the document's `kind` (below).
- **`description`** - one sentence of plain text; keep Markdown links and long context in the body.
- **timestamps** - quoted ISO 8601 local timestamp, `YYYY-MM-DDTHH:MM` (see [naming-and-formatting](naming-and-formatting.md)). Date-only `YYYY-MM-DD` is acceptable for migrated historical documents when the time is unknown.

## Status values

| `kind` | accepted `status` values |
| --- | --- |
| `scheme` | `active`, `done`, `released` |
| `effort` | `proposed`, `active`, `done` |
| `plan` | `proposed`, `in-execution`, `completed` |
| `log` | `in-execution`, `completed` |
| `report` | `passed`, `blocked`, `redirected`, `escalated` |
| `index` | `generated` |
| `jobs` | `active` |
| `discussions` | `active`, `closed` |

### Report status meanings

- **`passed`** - the oracle passed; this slice or effort is accepted.
- **`blocked`** - no oracle verdict was reached; an external condition, missing input, or unresolved question prevents evaluation.
- **`redirected`** - the oracle verdict landed above the plan; revise the effort, scheme, or goal, archive/supersede as needed, and stop for the human.
- **`escalated`** - a decision is required that the agent should not make alone.

## Recommended temporal fields

Date/time is useful in frontmatter because generated indexes sort and filter by it.

- **`created`** - timestamp when the document was created.
- **`updated`** - timestamp when the document's frontmatter or load-bearing body last changed.

## Optional edge fields

Graph edges belong in frontmatter only when generated indexes or link tools need them. Prefer main-body links for ordinary relationships.

- **`supersedes`** - archived document(s) this document replaces, only when an upward redirect happens.

Avoid default `parent`, `related`, `scheme`, `effort`, `plan`, and `report` fields. Those relationships are usually clearer in the document body because the body can name why the link matters.

## Examples

### Scheme

```yaml
---
kind: scheme
name: document frontmatter and indexing
status: active
description: Defines document frontmatter, its adoption range, migration path, and generated index tooling.
created: "2026-07-01T09:00"
updated: "2026-07-01T10:30"
---
```

### Effort

```yaml
---
kind: effort
name: document frontmatter reference
status: active
description: Defines the reference shape for YAML frontmatter on indexed Markdown work documents.
created: "2026-07-01T09:10"
updated: "2026-07-01T10:30"
---
```

### Plan

```yaml
---
kind: plan
name: document frontmatter reference
status: proposed
description: Implements the document-frontmatter reference and updates the surfaces that point to it.
created: "2026-07-01T10:00"
updated: "2026-07-01T10:00"
---
```

### Log

```yaml
---
kind: log
name: document frontmatter and indexing
status: in-execution
description: Records the opening decisions and edits for the document frontmatter/indexing scheme.
created: "2026-07-01T09:15"
updated: "2026-07-01T10:30"
---
```

### Report

```yaml
---
kind: report
name: document frontmatter reference
status: passed
description: Reports whether the reference is indexed, linked, and parseable.
created: "2026-07-01T11:00"
updated: "2026-07-01T11:00"
---
```

### Jobs

```yaml
---
kind: jobs
name: current work
status: active
description: Lists active and completed efforts with links to their work documents.
created: "2026-07-01T09:00"
updated: "2026-07-01T10:30"
---
```

### Discussions

```yaml
---
kind: discussions
name: exploratory discussions
status: active
description: Holds exploratory threads that are opened, narrowed, recorded, and closed.
created: "2026-07-01T09:00"
updated: "2026-07-01T10:30"
---
```

### Index

```yaml
---
kind: index
name: efforts
status: generated
description: Generated index of effort documents from their frontmatter fields.
created: "2026-07-01T09:00"
updated: "2026-07-01T10:30"
---
```

## Generated indexes

Generated indexes should read frontmatter and emit only the digest fields they need: path, `kind`, `name`, `status`, `description`, `created`, `updated`, and selected edge fields such as `supersedes`. They must not copy body prose, because copied body text drifts.

## Body stays authoritative

Frontmatter helps tools find and summarize documents; it does not replace the body. Assumptions, decisions, oracle details, related files, logs, evidence, and long explanations stay in the authored Markdown body.
