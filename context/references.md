# References

Non-normative facts, definitions, and background the conventions lean on, recorded once so a rule need not restate them. Owned by the conventions module; never a source of independent requirements.

## Index

- **document-frontmatter** - the YAML header shape for Markdown documents that generated indexes scan.
- **gradient-propagation-workflow** - the full work model: exploratory work before an oracle exists, oracle-driven work after one exists, the stability gradient (scheme / effort+oracle / plan), least propagation, archive/supersede, reports, jobs/indexes, and graph integrity.
- **naming-and-formatting** - surface-form standards for names, dates, versions, and language casing.
- **validation-model** - the framework's trust model: reliability is inherited from the process, so the process must converge; trust on a step is earned by the cheapest of two mechanisms that trade off by cost - an independent oracle (the anchor) or a visible, inspectable chain of work documents (traceability) - and it covers how trust is lost and what to guard against. `working-with-data` and `working-with-code` lean on it.
- **api-surface** - how to make a package's public surface legible, per language (Python annotations / `__all__`; MATLAB `arguments` / `Contents.m`).
- **artifact-manifest** - the machine format for an artifact's provenance record: the auto-emitted JSON sidecar and the generated index. `working-with-data` owns when a record is required; this owns its shape.
- **tree-graph-filesystem** - the model the framework's documents are organized by: a tree (containment, addressing) overlaid with a reciprocally-linked graph; leaves self-describe via headers and every summary view is derived from them, never authored.
- **re-enterable-context** - why `context/` is durable working memory and how a reader re-enters it cold: the two things re-entry reconstructs (where things stand / how it got here), the layered path, and the properties that make each layer trustworthy. `building-context` leans on it.
- **project-layout** - the concrete catalog of a project's key files and folders; the detail behind `where-files-live`.
- **work-documents** - the vocabulary of work documents: their roles, usual writing points, and distinctions used by `how-to-work-here`, `tracking-progress`, and the templates.
- **tool-usage** - the agent-facing router for choosing the right `aynit` command or Python API without reading the tool source.

A reference is referenced by a convention; it adds no independent requirement of its own.
