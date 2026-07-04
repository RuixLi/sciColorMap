# How to work here

Deliver work through a durable trail: explore until an oracle can be named, then plan against that oracle, evaluate by its verdict, and preserve the chain of trust.

## Scope

Nontrivial work in a project: exploratory discussion, oracle-driven delivery, and redirects between them. The user's explicit instruction overrides this convention.

Out of scope: the full model (`gradient-propagation-workflow`); document vocabulary (`work-documents`); progress surfacing (`tracking-progress`); writing code or proving data results (`working-with-code`, `working-with-data`); step-by-step execution tactics (the run-the-work skill).

## Normative core

- **Pick the mode by oracle readiness** - if no concrete oracle can be named, work in exploratory discussion; once a piece can name an outcome and oracle, move to oracle-driven work.
- **Make nontrivial work durable** - keep the relevant discussion, effort, plan, log, report, and jobs entry in files; chat alone is not a record.
- **Declare the oracle before the plan** - an effort states the outcome and the independent check that will decide success before implementation begins.
- **Decompose only when needed** - use a scheme for a large or ambiguous goal; split milestones when later outcomes depend on earlier results, and modules when pieces can be specified and checked independently.
- **Get human approval at the stable gates** - approve the scheme when there is one, the effort's oracle, and the plan before real implementation; loosen review only when the human chooses.
- **Execute from the plan and log meaningful changes** - the log records divergences, decisions, failures, artifacts, finish, and facts needed for re-entry; it does not bury the result.
- **Evaluate against the oracle** - a report's status follows the oracle's verdict, not whether the plan ran.
- **Redirect by least propagation** - route failure replaces the plan; oracle failure revises the effort; structural failure revises the scheme; goal contradiction revises the goal.
- **Retain and attend upward redirects** - effort, scheme, or goal redirects archive the superseded document intact, link `supersedes -> <archived-file>`, carry forward the distilled lesson, and stop for the human.
- **Protect untouchables** - never delete or overwrite raw data, existing results, superseded documents, or artifacts this work did not produce; redo only the current plan's own artifacts and log why.

## Conformance

- Static: an oracle-driven effort declares at least one oracle before its plan; each finished increment leaves a report whose status is the oracle's verdict; an upward redirect leaves an archived original and a `supersedes` link; nontrivial active work is reachable from the current-work surface.
- Reviewable: exploratory work narrows toward a decision or oracle; the oracle is independent of the route; redirects are placed at the lowest layer that accounts for the result.

## References

- [gradient-propagation-workflow](../references/gradient-propagation-workflow.md) - the full model and vocabulary dynamics.
- [work-documents](../references/work-documents.md) - the document roles.
