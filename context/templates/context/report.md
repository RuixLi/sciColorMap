---
kind: report
name: <increment name>
status: passed | blocked | redirected | escalated
description: "<one sentence: the oracle verdict and next action>"
created: "<YYYY-MM-DDTHH:MM>"
updated: "<YYYY-MM-DDTHH:MM>"
---
# <increment name> - report

> The outcome of a finished increment (`how-to-work-here`, `gradient-propagation-workflow`): based on the **oracle's verdict**, not on whether the plan ran. The boundary object - a next-action that links across exploratory and oracle-driven work *is* the mode handoff. Replace every `<placeholder>`, delete these `>` notes.

## Status

> A terminal state of the loop, placing the oracle's verdict under the propagation rule:
> - **passed** - the oracle passed; this slice (or the effort) is done. For a study, the one-line finding goes here.
> - **blocked** - no verdict reached; say why.
> - **redirected** - the verdict landed above the plan (effort / scheme / goal): the oracle, the structure, or the goal was revised. Archive the superseded document, record `supersedes`, and stop for the human.
> - **escalated** - a call the agent should not make alone; raised to the human.

- **<passed | blocked | redirected | escalated>** - <one line: the oracle's verdict and where it landed>.

## Related files

> The documents and artifacts this increment touched, for re-entry.

- [effort](<path>) · [plan](<path>) · <results / artifacts>

## Next action(s)

> Each an action plus a link to the document it acts on. The link must resolve to a document that exists or is about to, and that document opens by citing this report back. A link to a `discussions` thread is the handoff back to exploratory work.

- <action> -> [<target>](<path>)
