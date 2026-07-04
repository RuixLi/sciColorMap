# Building context

Build the context a reader enters and re-enters: a thin entry door (`AGENTS.md`) that orients in one read, opening onto a `context/` working memory a fresh agent or human can continue from without the original session.

## Scope

Writing and maintaining a project's entry point (`AGENTS.md`) and the navigability of the `context/` working memory it opens onto, so either reader can re-enter cold. Both archetypes. Assumes the entry point is read fully at session start and little else by default; the rest of the memory is reached on demand.

Out of scope, and only relied on: where the files live (`where-files-live`); the jobs / index state surface (`tracking-progress`); the archival that keeps the live chain current (`how-to-work-here`); the tree-and-graph mechanics (`tree-graph-filesystem`); per-document shape (`writing-for-the-user`). This convention requires these compose into a re-enterable whole; it does not restate them. The model is [`re-enterable-context`](../references/re-enterable-context.md).

## Normative core

### The entry door

`AGENTS.md` orients a reader in one read.

**Must be present and easy to find:**

- **Entry signal** - says this is the entry point, to be read fully.
- **Project identity** - purpose, archetype, status, language.
- **Working conventions** - point to the adopted conventions.
- **Declared deviations** - add-ons or overrides of those conventions.
- **Current work** - a pointer to the current-work surface (`context/jobs.md`, or the single current-work line when work is single-threaded; `tracking-progress`).
- **Navigation** - a compact `need -> file` map into the memory.

**Must not appear:**

- **Duplicated source** - no copied convention; point to the authoritative file.
- **Work details** - no inventory or history; point to the files.
- **Stale or unresolved** - every path resolves; every state is current.
- **Secrets** - point to setup or to variable names, never values.

### Re-enterability

The door must open onto a memory a fresh reader can continue from:

- **The door reaches where things stand** - from `AGENTS.md` a reader reaches the current-work surface - what is in flight and its next action - without reading history.
- **The active trail is reachable in a few hops** - from where-things-stand a reader can descend to the active effort and its plan, log, and report.
- **Re-entry is scoped** - a reader continuing one effort reaches its slice and that effort's own leaves, not the whole situation; a thin surface that routes well is sufficient (`re-enterable-context`).
- **Every hop on the entry path resolves** - each link on the door -> orient -> descend path lands on a real document (`tree-graph-filesystem`).

## Conformance

- Static: `AGENTS.md` exists at the repo root and every one of its links resolves; the entry path reaches the current-work surface, and from it the active effort's plan / log / report.
- Semantic: a fresh reader - agent or human, from the repo alone and without the original session - can identify the project, understand the conventions, reach where things stand, and descend to the active effort's trail, in one read plus a few hops.

## Reference

- The model: [`re-enterable-context`](../references/re-enterable-context.md) - why `context/` is durable working memory and how a reader re-enters it.
- The recipe: [AGENTS template](../templates/project/AGENTS.md) - realizes the entry-door must-haves in a skimmable arrangement. A starting recipe, not a second source of requirements; an existing `AGENTS.md` need not be rewritten to match its headings.
