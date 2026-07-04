# Working with data

A result you produce and rely on should be validated and reproducible - earn its trust, do not assert it.

## Scope

Producing a result or output you can rely on: data, figures, fitted models, analysis results, or a stated finding. Effort scales to consequence - a throwaway check and a published result do not warrant the same rigor (see `validation-model`).

Out of scope: how to write or change code (`working-with-code`); how to write or change documents (`writing-for-the-user`).

## Are your results reproducible?

- **Pin the environment, parameters, and seeds at production time** - in a file, not your head.
- **Keep raw data immutable** - never edit raw inputs in place; checksum them so silent corruption is detectable.
- **Name kept artifacts predictably** - project-created artifact names, dates, snapshots, and versions follow the [naming-and-formatting reference](../references/naming-and-formatting.md), unless tool-fixed.
- **Record provenance for the load-bearing** - core data and key results carry a provenance record (format: see `artifact-manifest`); throwaway intermediates do not.
- **Know your data and guard the seams** - inspect data before trusting an analysis on it, and assert invariants (shape, range, NaN, units) where silent corruption could enter, before relying downstream.

## Are your results valid?

- **Plan validation before execution** - plan the independent validation and expected outcomes before getting results.
- **Build the chain of trust** - a result is trusted iif its origin and every step on its path is trusted; any unverified or changed step leaves everything downstream unwarranted (see `validation-model`).
- **Anchor the novel to a trusted axis** - validate the new against something already trusted (see `validation-model`).
- **Ground a claim by its source** - do not state a function or domain fact you cannot source; verify it against a reference, never paraphrase from memory.
- **State the gap** - state the limitations when validation is partial or dependent on assumptions.

## Conformance

- Static: a relied-on capability names an independent check matched to its failure mode (suite green); a kept result has a recorded environment, parameters, seed, and provenance; raw inputs are checksummed.
- Semantic: whether the oracle is genuinely independent, whether the residual coverage is honest, and whether the provenance is complete enough to actually regenerate.
