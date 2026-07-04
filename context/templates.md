# Templates

Fill-in skeletons for a project's recurring documents. Copy one, replace every `<placeholder>`, and delete the guidance lines (the `>` notes).

Two families, by where the filled file lives:

- **context/** - working documents that instance into a repo's `context/` folder (a workflow's convergeable briefs and trail).
- **project/** - standing files a repo carries at its root (`where-files-live` universal core + the package adds).

## context/

The working documents named by the `work-documents` reference; names are universal - the archetype changes a document's content, not its name. Each follows `writing-for-the-user`, except `jobs`, the glanceable board (`tracking-progress`).

The **gate index files** - `efforts.md`, `plans.md`, `logs.md`, `reports.md` - are **generated** by indexing their folders, not authored, so they have no skeleton; report verdicts are carried by each report's `status` field (`tracking-progress`).

Authored skeletons:

- **scheme.md** (coordinator) - decomposes a goal into efforts via milestones (sequential) and modules (parallel). Home: `context/efforts/scheme.md`.
- **effort.md** (unit contract) - one effort: assumptions, decisions, and the up-front oracle. Home: `context/efforts/<name>.md`.
- **plan.md** (increment route) - one dated execution plan that realizes an effort's oracle: internal architecture and tests-first tasks. Home: `context/plans/<YYYYMMDD-name>.md`.
- **report.md** (increment outcome) - status by the oracle's verdict, related files, next action(s); the boundary object. Home: `context/reports/<name>.md`.
- **log.md** - one increment's chronological trail, a dated file. Home: `context/logs/<name>.md`.
- **jobs.md** (optional) - the authored worklist, one row per in-flight effort. Home: `context/jobs.md`.
- **discussions.md** (optional) - the record of exploratory work, in threads (`how-to-work-here`). Home: `context/discussions.md`.

## project/

The standing root files, package-flavored with `>` notes for the study variant. They realize the standing-file patterns in `where-files-live`.

- **README.md** - the human face (`writing-for-the-user`).
- **AGENTS.md** - the agent entry point; points, never duplicates the conventions.
- **gitignore** - copy to `.gitignore`; git tracks text source only.
- **pyproject.toml** - Python package manifest (PEP 621); or **ENVIRONMENT.md** for the language-agnostic case.
- **CHANGELOG.md** - Keep a Changelog + SemVer (package only).

`LICENSE` is not templated - pick standard license text whole.
