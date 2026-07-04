# Conventions

Durable, human- and agent-readable guidance for the stable patterns an agent cannot cheaply or consistently reconstruct. These are **defaults**: a project adopts them and records its own decisions on top. Skills operationalize them and tools check them; both derive from these conventions and never redefine them.

This is the gate to the rules. Non-normative facts are in [references.md](references.md), and fill-in shapes in [templates.md](templates.md).

## How to use

- **Adopt and deviate** - a project pins a version of these conventions (by reference or a hashed copy) and declares every deviation in `AGENTS.md`, linking the rationale to a project decision record (ADR) in `context/decisions/`.
- **Precedence when guidance conflicts** - an explicit user instruction wins; then a project decision (ADR) or other in-force context (a tool's or a source's format); then these defaults. A skill, tool, or template never overrides a convention. A genuine conflict *between two conventions* is a bug - each requirement has one owner - so surface it rather than choosing silently.
- **Read what applies** - load only the conventions relevant to the project and task; applicability is stated in each.
- **The normative core is the contract** - rationale, examples, and references explain it but add no hidden requirement.

## The conventions

Grouped by what you are doing.

### Enter and re-enter

- **building-context** - build the entry door and the re-enterable `context/` working memory a fresh agent or human continues from.

### Find your way

- **where-files-live** - where things go in a project, by archetype, and what is tracked vs synced; project-created paths follow the naming reference.

### Work with the user

- **writing-for-the-user** - shape user-facing messages and documents so the user catches what matters without spending attention twice.

### Do the work

- **how-to-work-here** - deliver work through exploratory discussion before an oracle exists, and oracle-driven planning once one can be named.
- **working-with-data** - make a result valid (independent oracle) and reproducible (pinned, traced).
- **working-with-code** - write, debug, surface, and version code so it is trusted and legible.

### Track and record

- **tracking-progress** - keep work status visible and trustworthy: an authored `jobs` worklist and a derived `status`.

### References

Non-normative facts, definitions, and background the conventions lean on, in [references.md](references.md): document-frontmatter, gradient-propagation-workflow, tree-graph-filesystem, re-enterable-context, validation-model, api-surface, artifact-manifest, naming-and-formatting, project-layout, work-documents, tool-usage.

Add a convention only as friction reveals it (conventions are debt too).
