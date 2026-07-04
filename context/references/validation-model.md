# Validation model

*The model the whole framework is built on: how an agent's research coding is made **reliable** - relied on because it was checked, not because it reads well. It is meant to be read once and held in mind; where a later convention says do X, this says why X follows.*

## 1. The problem: reliable work, faster than a human can check it

An AI agent accelerates research, and that is exactly what makes it dangerous. The work is **consequential** - a result will be relied on, built on, published on - and it is produced **faster than a human can police by hand**. The two naive responses each defeat one of those properties. Trust nothing the agent does, and you throw away the speed that made it worth using. Trust it because the output looks right, and you throw away reliability - because the most dangerous agent failures are precisely the ones that look fine: the code that runs clean and means nothing.

So the framework needs a way to establish reliability that is *cheap and mechanical enough to keep up with the speed*. Reliability is the goal; **trust** is how it is earned. And the single conviction underneath everything: **trust is a property of the process, never of how the output looks.** Whether a result reads well tells you nothing about whether it is right. What you can actually check is the path that produced it.

## 2. Trust is inherited through the process

A result is trusted only if it flows from a **trusted origin** through **trusted, unchanged steps**, each at the version used. Trust is inherited down that path, and it does not leap a gap: any untrusted or changed step leaves everything downstream *unwarranted* until it is re-checked. And trust is **scoped** - validating a step raises warranted confidence only within the domain and the version it was checked against; it does not make the step correct for every input, or forever.

This is why "it ran without error" is not reliability. Execution tells you the steps completed - not that each produced the right thing. Reliability is the stronger claim that every step from origin to result was warranted, and that claim is only ever as strong as its weakest link. The whole framework is machinery for keeping that chain of links intact and visible.

## 3. So the process must converge before it can be trusted

Because trust rides on the process, a process that is itself unpredictable cannot carry it. An agent that behaves differently across runs, sessions, and models breaks the chain before any check runs - you cannot warrant a step whose behavior you cannot even predict. So the first move is to **converge the behavior**: the framework does this with **conventions**, shared and durable defaults that make an agent's process legible and repeatable instead of improvised anew each time.

But here is the honest part. **Writing a convention down is not the same as enforcing it.** An agent that reads a rule may not follow it, the same way it may ignore a line in a prompt. So conventions are backed by **conformance checks** that test whether the rules were actually kept. And the limit must be stated plainly, because pretending otherwise is its own trust gap: the mechanical checks - static rules, tools - do **not** fully verify that a convention was followed. They catch missing structure, broken links, surface drift; they do not catch whether the intent was honored. **Semantic review by a human or another agent is load-bearing** here, not a nicety. The machine checks what it can mechanically; the reviewer carries the rest, and the design should never quietly assume the machine covers more than it does.

## 4. Earning trust: a ladder, cheapest first

Given a step, how do you actually warrant it? Take the cheapest workable way first:

- **Authority** - lean on a trusted source: a language built-in, a pinned library, checksummed data. The cheapest, when it applies.
- **Property** - show it is provably the right shape, range, or symmetry, whatever the specific answer turns out to be.
- **Reference (the oracle)** - show it agrees with an answer you trust *independently*. This is what earns trust for genuinely new work.
- **Inspection** - a human, or an agent, reads the process and understands why it is right.

The top two are cheap but only reach so far; new work almost always comes down to the bottom two. And those two - the **oracle** and **inspection** - are the framework's load-bearing mechanisms, worth taking in turn, because they **substitute for each other by cost and availability.**

### The oracle - the anchor

The oracle is a predefined, explicit, testable check, *independent* of the work and declared *before* it starts. Its power is efficiency: when a good oracle exists, the work is trusted with little further validation - a single check settles it. That is what makes trust affordable at agent speed, and it is why the workflow makes every effort declare its oracle up front, before the route exists.

Two properties make an oracle real. The first is that it **pins one axis.** You can only validate the novel against the trusted, so at least one axis must be anchored. Frame the output as *data* (known or novel) flowing through an *analysis* (a vetted transform, or novel from-scratch code):

- **Both already trusted** - a vetted transform on data with a known answer; re-run it as a regression.
- **Novel data, known analysis** - trust propagates from the transform, so guard the *input*: shape, range, units, NaNs, against the transform's validated domain. The risk here is scope mismatch and silent corruption, not the math.
- **Known data, novel analysis** - run the new code against the known answer; agreement earns its trust. This is the from-scratch case.
- **Both novel** - nothing to anchor against; make the output legible, cash out every term, and flag the gap - it is the user's call, not something to paper over.

The second property is **independence.** An oracle earns trust only when its expected value has authority independent of the work under test. An answer derived from your own reading of the code shares a single point of failure with the code - your possibly-wrong mental model - so a green run proves nothing. Independent oracles, cheapest first: a **null or negative control** (an input whose answer is known-trivial - zeros, identity, pure noise, the null hypothesis - which catches an analysis that "finds" structure that is not there); an **analytical limit or invariant** (a property any correct implementation must hold - symmetry, conservation, monotonicity, a bounded range - which cannot be gamed); a **hand-computed or published case**; or a **second implementation** run as a differential test. Match the oracle to the failure mode you fear - a null control is the guard for plausible-but-wrong, not a universal requirement.

### Traceability - the visible chain

But good oracles are not always there. Sometimes nothing independent exists to anchor against; sometimes the only real check is too slow or expensive to run each increment. When you cannot anchor, trust falls back on the other rung - **inspection** - and inspection has a precondition that is easy to forget: the process must be **visible.** You cannot inspect what was never recorded.

This is what the work-document system is *for*. The effort that declared the outcome, the plan that routed to it, the log of what actually happened, the report that judged it against the oracle - these are not token overhead or bureaucratic ceremony. They are the **visible chain**: the recorded process a human or agent reads to warrant a result by inspection when no oracle can settle it. A result whose process is invisible is unwarranted by default; a result whose process is legible can be trusted by reading it.

The two mechanisms trade off. A strong oracle needs little tracing - the check settles it, and the trail can be thin. A weak or absent oracle leans hard on the visible chain - the reading is the check, so the trail must be complete. Most real work uses both: an oracle where one exists, a legible trail everywhere else. And the rule governing how far you go on either is **scale effort to consequence** - how much a result will be relied on sets how hard you defend it.

## 5. How trust is lost

A warranted step does not stay warranted for free. It loses trust when:

- it was **never validated** - the default state of agent-prepared data and from-scratch code;
- it **changed** since it was validated - *decay*, which a hash detects;
- something it **depends on** lost trust, though it is itself unchanged - an *upstream break*, which propagation over the chain detects;
- what it was **validated against** moved - the data was replaced, or the reference answer turned out wrong - *stale ground*, where the change is detectable but the wrong reference is not;
- it is **applied outside** its validated domain - a *scope mismatch*, not detectable per link; it shows up only as residue.

## 6. What to guard against

The failures worth fearing are the ones that look fine on the surface:

- **silent data corruption** - a wrong reshape, a bad merge, off units, stray NaNs: output with no error, and nothing to signal it. The most dangerous, because nothing draws the eye.
- **plausible-but-wrong** - it runs, it reads fine, it means nothing; only a domain expert catches it.
- **reproducibility rot** - a past result cannot be regenerated: environment drift, an unpinned dependency, an unrecorded parameter, no seed.
- **provenance loss** - you cannot say what produced an artifact, or what a label or a metric means.
- **silent break** - a broad edit breaks something the diff hides; without a test there is no signal.
- **scope creep** - a large change burying the small one that was asked for; a 400-line diff for a 5-line fix is not reviewable.
- **communication mismatch** - an assumption or a decision that was never surfaced for the human to catch.

Each is, in the end, a missing rung on the ladder - a check that would have caught it and was never run.

## 7. In practice

These are the principles the model implies; each is operationalized by a convention, not enforced by this reference.

- The agent **augments** the human's judgment; it never overrides it. A trust call in doubt is the human's.
- **Scale effort to consequence** - defend a result in proportion to how much it will be relied on.
- **Assume a gap** on work that will be relied on, until a check closes it; **flag a gap** you cannot close, and ask how to proceed.
- **Validate each step as you go and record it** - and never break a step that was already trusted.
- **Verify with fresh evidence before claiming done** - re-run and re-check; do not assert a result you did not just observe.

## 8. How it is realized

- The workflow that declares and checks oracles, and places a verdict by least propagation: `gradient-propagation-workflow`.
- The documents that form the visible chain, and the structure they live in: `work-documents`, `tree-graph-filesystem`.
- The principles above are operationalized by the conventions - `working-with-data` (validate a result), `working-with-code` (test and protect code), `how-to-work-here` (decide by consequence, verify before done) - not enforced by this reference. A reference is referenced by a convention; it adds no independent requirement of its own.
