# Where files live

File location conventions ensure an agent or human finds them without searching. The detailed catalog of each file and folder is the [project-layout reference](../references/project-layout.md); surface forms are in the [naming-and-formatting reference](../references/naming-and-formatting.md).

## Scope

A default directory structure of a `study` or `package` repo; a repo may declare its own layout in `AGENTS.md`.

Out of scope: how to write the key files (the [templates](../templates.md)); a package's public API shape (see `working-with-code`, the [api-surface reference](../references/api-surface.md)); the details of composition (see [project-layout reference](../references/project-layout.md)).

## The core

- **Every project must have** `README.md`, `AGENTS.md`, an environment manifest, `.gitignore`, `src/`, `tests/`, and `context/`.
- **No loose files at the repo root.**
- **Project-created paths identify their content** - file and folder names follow the [naming-and-formatting reference](../references/naming-and-formatting.md), unless the repo, tool, or language already has a required scheme.
- **`AGENTS.md` is the work entry point** - it links to the key parts of the repo (`building-context`).
- **`README.md` is the conceptual overview** - it describes the project, its purpose, its design, and how to use it.
- **Files are linked as tree graph** - the folder `X/` holds relevant files as leaves and uses `X.md` as an index of them in `X/`; the branch stays stable and references do not churn (see `tree-graph-filesystem`).

## Version control

- **text sources are tracked**: thin Markdown, code, and small config files are tracked by git.
- **huge or binary artifacts are synced**: large or binary data is synced out-of-band by e.g. OneDrive.
- **A manifest bridges both** - an un-trackable file gets a small committed provenance record (the [artifact-manifest reference](../references/artifact-manifest.md)) as its git shadow.
- **Keep `.git` out of an actively-synced folder** - a synced `.git` corrupts (its many small files upload mid-write); put it on local disks.
- **Ephemeral local dirs** (e.g. `run/`) are neither tracked nor synced.
- **Superseded files are archived, not deleted**, with the replacement linking to what it supersedes.

## Conformance

- Static: no loose files at the root; key files/folders for the archetype exist; project-created paths follow the naming reference or a declared scheme; data and binary paths are git-ignored. `.git` is not in a synced folder. A manifest exists for each un-trackable artifact.
- Semantic: whether the structure fits the project and the tracked/synced split is honored.
