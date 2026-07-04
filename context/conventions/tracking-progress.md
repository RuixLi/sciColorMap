# Tracking progress

Surface work progress and state, so a fresh agent can see how things are going on when interrupted.

## Scope

Surfacing work state and pointing to the documents that carry its detail. Both archetypes.

Out of scope: the workflow (`how-to-work-here`); the roles of the documents (`work-documents`) and their format (`writing-for-the-user`).

## Normative core

- **Keep work durable** - nontrivial work lives in files, not only in chat, so it survives across sessions.

- **Keep work traceable** - multistep work is logged in a chain of documents, so a fresh agent can see how things are going on and come to be.

## Two systems, two disciplines

Work progress lives in two systems that must not be merged:

- **Job interface is authored** - `jobs.md` is a human- and agent-written list. It may reference generated indexes but does not replace them.
- **Indexes are derived** - index files are tool-derived lists built from document frontmatter, and cannot disagree with their source. These files are generated, not authored. They include `efforts.md`, `plans.md`, `logs.md`, `reports.md`. See [tree-graph-filesystem](../references/tree-graph-filesystem.md) and [document-frontmatter](../references/document-frontmatter.md).

**The direction of flow is fixed:** work documents are the source of truth, gate files derive from them, `jobs` is authored alongside.

## Job interface

- **Link `AGENTS.md` to `jobs.md`** - a current-progress section links a `jobs.md` interface in `/context`.
- **List work in `jobs.md`** - one row per `effort`, with its cycle state and a pointer to the relevant documents (see `work-documents`) that carry its detail.
- **Point, do not copy** - links but never restates a document's content.
- **Use stable work-document names** - document roles come from `work-documents`; dated names and versions follow the [naming-and-formatting reference](../references/naming-and-formatting.md).
- **Move finished work to `### Done`** - a closed effort keeps its resolution link, but is in the `### Done` section.

## Work history

- **Log decision-making** - decisions and their rationale are recorded in the relevant documents, ensuring traceability and accountability.
- **Log file-changing** - file changes are logged in the relevant documents, ensuring traceability and accountability.
- **Log progress updates** - work state updates are logged in the relevant documents, ensuring traceability and accountability.

## Conformance

- Static: `AGENTS.md` points to the `jobs.md`; `jobs` lists all effort with its synced state documents; no entry duplicates what it points to; indexes are the tool's projection of file states, not hand-authored (unless declared as a deviation).
- Semantic: whether the board is genuinely graspable at a glance, and whether `jobs` carries the intent the derived indexes cannot.

## Reference

See [Jobs template](../templates/context/jobs.md) for a recipe.
See [Work documents](../references/work-documents.md) for the roles of the documents that carry work detail.
