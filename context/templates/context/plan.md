---
kind: plan
name: <increment name>
status: proposed | in-execution | completed
description: "<one line: what this increment delivers toward the effort's oracle>"
created: "<YYYY-MM-DDTHH:MM>"
updated: "<YYYY-MM-DDTHH:MM>"
---
# <increment name> - plan

> One increment's execution route (`how-to-work-here`): the *internal* architecture and ordered, tests-first tasks that satisfy an effort's oracle. Dated and disposable - a failed route is re-planned, the effort untouched. Realizes [effort](<path to the effort>). Replace every `<placeholder>`, delete these `>` notes.
> Status: proposed | in-execution | completed

<one line: what this increment delivers toward the effort's oracle>.

## Work documents

> Link the effort this plan implements and the log that records this plan's execution. Keep relationships here, not in frontmatter.

- Effort: [<effort name>](<relative path to effort>)
- Log: [<log name>](<relative path to log>)

## Decisions

> Route-level calls only - the effort holds the contract-level ones. Split by the agent's confidence.

### Needs your response

- **<choice> [<task>]** - options: <A / B>; recommendation: <A>, because <reason>.

### Already made

- **<choice> [<task>]** - <one-line reason>. (Flip any you dislike.)

## Architecture

> The internal structure this route builds - where each piece of the effort lives. For a package, the private modules / functions behind the public surface; for a study, the analysis pipeline, one function per step.

- <component / step> -> `<path>`   in: <input>   out: <output>

## Tasks

> Tests-first; implement and verify per step. Each task names the check that proves it.

- [ ] failing test / validation for <x> -> implement -> run -> verify
- [ ] ...

## Untouchables

> Before touching files: never edit raw data or existing results, never delete or overwrite what this work did not produce; archive a superseded attempt rather than lose it (`how-to-work-here`, `working-with-data`).

- <named raw inputs / existing outputs this increment must not alter>.
