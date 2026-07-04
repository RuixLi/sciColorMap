---
kind: scheme
name: <goal name>
status: active | done | released
description: "<one sentence: what the goal is and for whom>"
created: "<YYYY-MM-DDTHH:MM>"
updated: "<YYYY-MM-DDTHH:MM>"
---
# <goal name> - scheme

> The coordinator over a goal's efforts (`how-to-work-here`): the decomposition into **milestones** (sequential - each builds on the last) and **modules** (parallel - independent), which may coexist, plus the integration contract. The most stable layer - approved once, amended by exception; rolling-wave: detail the next milestone or two, the rest is a hypothesis. Home: `context/efforts/scheme.md`. Follows `writing-for-the-user`. Replace every `<placeholder>`, delete these `>` notes.
> Status: active | done | released. At `released` a package's top-level gateway freezes (drift-check MUST).

<one sentence: what the goal is and for whom>.

## Background

> The problem and why it matters - the context a reader needs to judge the goal and its decomposition.

<what is unknown, or what it does and who uses it; what makes it non-trivial>

## Assumptions

> What the decomposition rests on; what breaks if false. Audit these first.

- **<assumption>** - if wrong: <which efforts change>.

## Decisions

### Needs your response

- **<choice>** - options: <A / B>; recommendation: <A>, because <reason>.

### Already made

- **<choice>** - <one-line reason>. (Flip any you dislike.)

## Strategy

> How the goal is attacked - the reasoning that turns it into these efforts, in this shape, and why these and not others. For a study, the hypothesis and the expected results the efforts test.

<2-4 sentences>

## Efforts

> Each effort, its dependency, and where it sits. Mark it a **milestone** (sequential) or **module** (parallel). Detail the next 1-2; the rest are a hypothesis the results may revise.

1. **<effort>** (milestone | module) - <checkable outcome>.
   - Depends on: <prior effort / external>. Status: planned | active | done | hypothesis. Effort: [<effort>](<effort>.md).
2. **<effort>** (milestone | module) - <...>.

## Integration contract

> (Package) The seam check: composition is not transitive (`working-with-data`), so the joints need their own oracle beyond each effort's. A study of independent modules may omit this.

| seam | what must hold | check |
| --- | --- | --- |
| <effort A -> effort B> | <the joint behaves> | `tests/validation_<seam>.py` |
| end-to-end | <a minimal full run> | `tests/smoke_<pkg>.py` |

## Revisions

> Append on an upward redirect that reshapes the decomposition: archive the superseded scheme intact, the replacement records a `supersedes` link, and the human approves the distilled lesson (`how-to-work-here`).

- **<YYYY-MM-DD>** - <what changed, and which result forced it>.
