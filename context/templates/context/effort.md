---
kind: effort
name: <effort name>
status: proposed | active | done
description: "<one sentence: what this effort delivers and for whom>"
created: "<YYYY-MM-DDTHH:MM>"
updated: "<YYYY-MM-DDTHH:MM>"
---
# <effort name> - effort

> The contract for one effort (`how-to-work-here`): a unit of work that declares, **up front**, the oracle that will decide its success. One per unit; it rolls - extend the next slice before its plan. Realized by one or more dated `plan`s. Follows `writing-for-the-user`. Replace every `<placeholder>`, delete these `>` notes.
> Status: proposed | active | done.

<one sentence: what this effort delivers and for whom>.

## Outcome

> What means done for this effort. State the boundary clearly enough that execution cannot drift beyond it.

- <done means this concrete outcome exists and passes the oracle>.

## Assumptions

> Load-bearing only: what this rests on, and what breaks if false.

- **<assumption>** - if wrong: <what changes>.

## Decisions

> Split by the agent's confidence, not the user's priorities. You converge here.

### Needs your response

- **<choice>** - options: <A / B>; recommendation: <A>, because <reason>.

### Already made

- **<choice>** - <one-line reason>. (Flip any you dislike.)

## Oracle(s)

> The load-bearing section: the concrete, independent check(s) that decide success, declared *before* implementation (`how-to-work-here`, `gradient-propagation-workflow`). "Done" means the oracle passes, never that the plan ran. Pick the form by the work:
> - **code** - a test (`tests/test_*`); name the capability and the test that pins it.
> - **analysis / data** - a validation against an independent oracle (`working-with-data`, `validation-model`); name the reference / invariant / null control.
> - **framework / docs** - conformance plus an independent audit.

| capability / claim | oracle (independent, up-front) | check |
| --- | --- | --- |
| <what must hold> | <test / validation / conformance + audit> | `tests/<name>` or <how it is checked> |

## Scope

- In:  <what this effort covers>.
- Out: <non-goals; untouchables: never edit raw data or existing results>.

## Design

> The conceptual design a human reads to judge intent - principles, structure, the derivations. The *internal* architecture and the task route live in the `plan`, not here.

<the design narrative>

## Public interface

> What callers see, surfaced so the agent and human can use it without reading the source (`api-surface`); a study effort names its expected results or deliverables instead. Point to the gateway; do not duplicate signatures.

- <`<pkg>.<fn>` - what it does> / <expected result or deliverable>.

## Seal

> When the oracle passes, record the validated version in the `artifact-manifest` trust block, so later drift is caught as decay (`validation-model`).

- Sealed at: <commit / version>; ground: <reference / conformance>; by: <who>, on <YYYY-MM-DD>.
