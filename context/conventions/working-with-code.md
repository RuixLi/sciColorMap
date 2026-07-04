# Working with code

Write, debug, surface, and version code so it can be understood and trusted.

## Scope

Writing or changing code in any repo.
Out of scope: where code files live; the full per-language styling catalog.

## Writing it

- **Reuse before adding** - search the existing API first; do not reinvent.
- **Smallest change that works** - do only what was asked; every changed line traces to the task; no unrequested features, abstractions, or speculative error-handling.
- **Names carry intent and language shape** - identifiers make purpose inferable and follow the language casing in the [naming-and-formatting reference](../references/naming-and-formatting.md).
- **One job per function, legible to the researcher** - small enough to read in one pass; explicit over clever; comment the purpose, the call syntax, and any non-obvious step.
- **Clean up only your own mess** - remove orphans your change created; flag pre-existing dead code, do not delete it.

## Testing it

- **Test-driven by default** - for non-trivial behavior, write the failing `test_*` first, then the code that makes it pass. Skip the ceremony only for trivial or throwaway code.
- **A test is not a validation** - a `test` proves the *code behaves as intended*; a green `test_*` does not mean the result is correct. See `working-with-data` for how to validate a result.

## Debugging it

- **Don't change what you cannot explain** - read the code and state what it does first; the line you would remove may be a guard (Chesterton's fence).
- **Find the cause before the fix** - trace a bad value to its origin and fix at the source, not where it surfaces; a symptom-patch leaves the real cause corrupting results.
- **Reproduce in a failing test before fixing** - it proves you found the cause and stops the bug returning.
- **After repeated failed fixes, question the design** - stop patching and raise it.

## Building it

A package's public surface should be visible: users learn the API and every signature without opening the source.

- **Public functions are self-describing** - typed signatures, a one-line meaning, options keyword-only, internals hidden behind the `_` / `+private` boundary.
- **One curated gateway** - the public index (`__init__.py` `__all__` / `Contents.m`), kept in sync with the code.

## Gitting it

- **Commit one logical change** - a commit you cannot summarize in one line is doing too much.
- **Keep known-good points** - commit each completed logical step in a state that passes its own checks, so a rollback always lands somewhere consistent.
- **Isolate risky work** - experimental or parallel work goes in a `git worktree`, never the main checkout; establish a clean baseline before branching.
- **Roll back, don't patch forward** - on breakage, return to a known-good state rather than stacking fixes on a broken base.

## Conformance

- Static: non-trivial behavior has a `test_*` written before it and the suite is green; the public gateway syncs the real code.
- Semantic: commits are single-purpose. legibility to the researcher, whether the cause was actually found before a fix, and whether a change stayed in scope.

## References

- Repo structure (see `where-files-live`)
- Per-language API conventions ([api-surface reference](../references/api-surface.md))
- Naming and language casing ([naming-and-formatting reference](../references/naming-and-formatting.md)).
