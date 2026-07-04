# AGENTS.md

You are reading `AGENTS.md`, the entry point for agents working on this project. Read it fully at the start of each session. It provides the project overview, essential project-level instructions, and pointers to deeper context to load when relevant.

> This is the recommended recipe for the [building-context content contract](../../conventions/building-context.md); [where-files-live](../../conventions/where-files-live.md) places the filled file at the repo root. The headings and order are not requirements: combine, split, rename, or reorder them to fit the repo. Replace every `<placeholder>` and delete these `>` notes.

## Project

- **What:** <one-line overview>.
- **Goal:** <what "done" looks like>.
- **Outputs:** <the deliverables>.
- **Primary language:** <Python | MATLAB | ...>.
- **Archetype:** <study | package>. <Status: dev | released   - package only; delete for a study.>

## How to work here

> The few repo-specific non-negotiables and essential setup/build/test/validation commands or pointers. Keep this short - the conventions hold shared guidance.

- **Conventions:** <conventions location>, <version-manifest>. Follow them; deviations are declared below.
- <non-negotiable, e.g. never edit `data/raw/`>.

### Deviations from the conventions

> Declared overrides only, each with a concise reason and conventions version. For load-bearing rationale or consequences, link the project ADR and keep the detail there. Empty is good - it means no drift.

- None. or:
- <xx> (derived from <conventions> v<x.y.z>); [<ADR>](context/decisions/<decision>.md)
  
## Current work

> point to `context/jobs.md`. Do not copy state here (`tracking-progress`).

- <pointer, or: None active.>

## Where to look

| need | file |
| --- | --- |
| conventions | `context/conventions.md` |
| glossary | `context/glossary.md` |
| decisions / ADRs | `context/decisions/` |
| work status | `context/jobs.md` |
| readme | `README.md` |
| plans | `context/plans.md` |
| logs | `context/logs.md` |
| environment | `<pyproject.toml, ENVIRONMENT.md>` |
