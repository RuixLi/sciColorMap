# The gradient-propagation workflow

*A model for delivering trusted work, by humans and agents, when the goal is clear but the path is not.*

This document explains a model. It is not a set of rules — those live in the conventions and skills that operationalize it. Here the concern is the shape of the thing: what the layers are, why they are separated the way they are, how a result moves through them, and what each separation buys. The model is meant to be read once at the start and held in mind, so the reasoning matters more than any individual prescription. Where a later convention says *do X*, this document says *why X follows from the shape.*

The model assumes a particular situation, and is honest that it does not fit every situation. It assumes a goal that is **clear but revisable** — known well enough to begin decomposing, yet open to revision if a result later contradicts it. When the goal is not even that — when you cannot yet say what success would look like — a different mode applies, and the boundary between the two is one of the things this document defines.

---

## 1. The problem: trust without rigidity

The work this model is built for has two properties that pull against each other. It is **consequential** — the result will be relied on, so it has to be trustworthy. And it is **uncertain** — you do not know the full path at the outset, so any plan you commit to up front will be partly wrong. The naive responses to each property defeat the other. Demand trust through up-front rigor, and you get a rigid plan that shatters on contact with the first surprising result. Embrace uncertainty through pure improvisation, and you get fluid progress that no one can later verify or re-enter.

The usual failure is not choosing one pole but oscillating between them: a careful plan that, the moment reality diverges, is quietly abandoned and improvised past, leaving a result that looks planned but was not, and cannot be trusted because no one can say which parts held. The plan-on-paper and the work-as-done drift apart silently, and the drift is invisible until someone tries to rely on the result and cannot reconstruct how it was reached.

The model resolves this not by balancing the two properties but by **separating the parts of the work that must be stable from the parts that must stay fluid**, and giving each its own home. Trust comes from the stable parts being defended; flexibility comes from the fluid parts being cheap to revise. The whole architecture is an answer to one question: *which parts of work should resist change, and which should invite it?*

The answer is a gradient.

---

## 2. The gradient: three layers of decreasing stability

A clear goal still hides three distinct kinds of unknown, and each kind is a layer. They are not arbitrary divisions; they are the three questions you must answer to turn a goal into a trusted result, and they have genuinely different natures — they become knowable at different times, they are revised by different events, and they should be defended with different effort.

**The structural unknown — what are the parts, and how do they depend on each other?** This is answered by the **scheme**. Before doing anything, you decompose the goal: into pieces that must happen in sequence because each builds on the last, and pieces that are independent and can proceed in parallel. The structural unknown is resolved early and, in a clear-goal regime, changes rarely — you usually know roughly how the work breaks apart even when you do not know how any single part will turn out. Because it changes rarely and because getting it wrong is expensive (a bad decomposition makes everything downstream fight the structure), the scheme is the **most stable** layer: settled with care, then amended only by exception.

**The semantic unknown — what does success actually mean for this piece, concretely enough to check?** This is answered by the **effort**, and specifically by the **oracle** it declares. You know the goal, but "the goal" is not checkable until you can name the precise observable result that would confirm a piece of it. And here is the crucial fact: you usually *cannot* name that observable for a later piece until an earlier piece's result is in hand. The semantic layer is therefore the one that genuinely **rolls** — it cannot be fully specified up front, because each result teaches you what the next success-condition should be. It is more stable than the route but less stable than the structure: it accretes as you learn.

**The procedural unknown — by what route do you produce that observable?** This is answered by the **plan**. Given a known success-condition, you lay out the ordered steps that reach it. The route is the **most disposable** layer. It is a hypothesis about *how*, written just before you need it, expected to be partly wrong, and thrown away after one increment. A failed route costs almost nothing — you write another. Investing heavily in a plan is itself a mistake, because the first step's result may invalidate the rest.

These three stack into a single axis:

    scheme   —  structural  —  most stable    —  approved once, amended by exception
    effort   —  semantic    —  rolls          —  accretes as results arrive
    plan     —  procedural  —  most disposable —  written just-in-time, discarded after

Stability decreases as you descend; revision-frequency increases. This axis is the spine of the entire model, and naming it explicitly does real work, because it stops two confusions that plague less-structured versions of the same idea. Without the axis, the *rolling* nature of the effort seems to threaten the scheme — if specs roll, does the whole structure roll? (No: rolling lives at the effort layer; the scheme is stable.) And the *approval* attached to stable layers seems to freeze the plan — if work is approved, is the route locked? (No: approval lives at the scheme and effort layers; the plan is disposable.) Both confusions dissolve the moment you see that stability is a *gradient*, not a uniform property of "the work."

---

## 3. The unit of work: the effort and its oracle

The middle layer is where the model's central bet is placed, so it deserves the most care.

An **effort** is one unit of execution that the scheme carves out. Deliberately, its *size* is left unfixed: an effort can be a single function, an entire module, or one transformation step in a data-processing pipeline. Scale is a judgment the scheme makes when it decomposes. What makes something an effort is not how big it is but a single obligation: **it declares an oracle before it is built.**

The **oracle** is the concrete, independent check that decides whether the effort succeeded. For a piece of software, the oracle is typically a test. For a piece of analysis, it is a validation against some ground truth that the analysis does not itself produce. The oracle is the load-bearing object of the whole model, and three properties make it so — all three required, none optional.

*It is declared up front, before the route exists.* This is what keeps it honest. An oracle invented after seeing the result is not a check; it is a rationalization of whatever happened, with the bar moved to wherever the ball landed. Declaring the success-condition — and its threshold — before building anything is what makes the eventual verdict mean something.

*It is independent of the thing it checks.* A test is not the code; a validation is not the pipeline step. Independence is the property that makes passing the oracle informative. If the check is defined by the same reasoning that defines the route, then passing it proves only that the route ran as the route intended — a tautology. The sharp test of independence: *could this oracle be written by someone who has never seen the plan?* If specifying the check requires knowing the route, the check is contaminated by the route.

*It is concrete — it can fail even when the code runs without error.* This is the single most useful property, and the most often violated. An oracle that only fails when something crashes is not testing success; it is testing execution. "The function returns a dataframe" is not an oracle — it passes whenever the code runs. "The merged dataframe matches the reference join on the held-out keys" is an oracle — it can run cleanly and still be wrong, and that possibility is exactly what makes it a check.

It is worth being honest about what the oracle can and cannot guarantee. It cannot guarantee correctness in any deep sense; an agent or a human can write a concrete, independent-looking oracle that nonetheless fails to capture what really matters. The oracle's primary role is not epistemic purity. **It is a legibility-forcing device.** Requiring an oracle forces the work into a shape where success is explicitly stated and checkable — where a human at an approval gate can look and judge whether the stated check actually pins the thing that matters. The deepest failure mode is therefore not "wrong oracle" but "no real oracle": something oracle-shaped that satisfies the form while pinning nothing. Catching that is human judgment, exercised at the moment the effort is approved — which is exactly why approval attaches to the oracle, and why it is the human's, not the tool's.

A consequence worth stating: the validation *method* belongs to the oracle, declared in the effort — not to the plan. If the plan owned the method of checking, the check would be defined by the same document that defines the route, and independence would be lost. The plan builds the thing the oracle will check; it does not get to decide how the checking is done.

The effort and its plan are kept in **separate documents**, and the reason is the gradient. The effort is one per unit, stable, rolling only when a result forces it. Plans are many, dated, disposable. A stable thing and a churning thing should not share a file: if they did, re-planning a failed route would disturb the neighborhood of the stable oracle, and the *spec/plan conflation* the model exists to prevent would creep back in structurally. Separation is also what lets one effort be advanced by a *sequence* of plans as the work is built incrementally — which is how real pipelines and real modules actually come to exist.

---

## 4. The loop: how an effort is delivered

With the layers in place, the working cycle is simple to state:

    decompose
      └─ for each effort:
           ground the situation
           declare the oracle        → approve
           write a plan to the oracle → approve
           execute, logging as you go
           evaluate against the oracle
           report the verdict
      └─ repeat until the goal's efforts pass their oracles

Two features of this loop carry most of its weight.

First, **approval sits at two points, and they approve different things.** Approving the oracle is approving *what would count as done* — the success-condition, before any route exists. Approving the plan is approving *how to get there* — later, separately. Splitting the approval is what makes the effort an approvable artifact on its own: you can sign off on "yes, that is the right definition of success" without yet knowing the route, and if you cannot, it is a sign the oracle is not really independent of the route.

Second, **"done" is the oracle's verdict, never the plan's completion.** A plan whose every task is checked off has not delivered anything; an oracle that passes has. This is why the report keys off *evaluation*, not execution. Execution finishing tells you the route ran. Only the oracle tells you the route ran *and produced the right thing*. The distinction sounds pedantic until you have watched work declared done because the code ran, and then discovered the result was wrong all along.

The cycle is **incremental and rolling**. Each pass through it is one dated increment that advances the same effort. You do not specify the whole effort up front; you ground where you are, declare the next slice of the success-condition, route to it, and let the result tell you what to specify next. This is the practical form of "the semantic layer rolls": the contract for an effort is built up across increments, redirected by what each increment reveals.

---

## 5. Propagation: how a result moves, and how far

The loop describes the happy path. The model's real content is what happens when a result is *not* what was expected — because that is the common case, and how a framework handles surprise is what determines whether it survives contact with reality.

When a result comes back and the oracle is evaluated, the verdict must be **placed** — assigned to the layer it actually implicates. There are exactly four places it can land, and they form an ordered ladder up the stability gradient:

**The route was wrong; the success-condition still stands.** The oracle was right, but the plan did not reach it. This lands at the **plan** layer. You write another plan. It is cheap, local, and disposable — the oracle is untouched, and nothing above the plan is disturbed.

**The success-condition itself was wrong or uninformative.** The route ran, but the result revealed that what you thought would confirm success does not. This lands at the **effort** layer: you revise the oracle. Crucially, *this is not a failure* — it is information. It is the normal texture of research, where you frequently learn that your operationalization of success was off. Treating it as a defect is a category error that punishes the work for teaching you something.

**The structure was wrong.** The result is fine on its own terms, but it reveals that a part or a dependency was misjudged — two things you thought independent are not, or a sequence you assumed was unnecessary. This lands at the **scheme** layer. It is rare and expensive, because re-cutting the structure disturbs everything hung from it.

**The result contradicts the goal.** The top escape hatch. The goal itself was misframed, and no revision of structure, success-condition, or route will save it. This lands at the **goal**, and reopens the question of what the work is even for.

The governing principle across all four is **least propagation: resolve at the lowest layer that genuinely accounts for the result, and escalate only when the layer above is actually implicated.** A result enters at the bottom and rises only as far as it must. This is not a bias toward laziness; it is a discipline of honesty. Escalating too eagerly churns stable layers that were not actually wrong; escalating too reluctantly papers a deep problem over with a local patch. The rule is to find the true level of the cause and stop there.

What makes least propagation *operational* rather than merely advisory is that the layers fail in distinguishable ways. "Did the route fail, or did the oracle fail?" is answerable by looking at whether the steps completed but the check still rejected (oracle-level) versus the steps not reaching the check at all (route-level). Because the spec and the plan are separate artifacts that fail differently, you can read *which* one broke. This is the entire payoff of separating them: folding the success-condition into the route would make a routing change look identical to a goal change, and the diagnosis would be lost.

There is a fifth possibility that sits above even the goal: a result that does not just contradict the current goal but **invalidates the very notion of what would count as success** — the question becomes unplannable again. This does not revise anything inside the model; it kicks the work back out into the exploratory mode (§7). Naming this exit is important, because without it, a re-opened question gets forced through the rigid machinery and corrupts the layer that depends on always having a concrete oracle.

---

## 6. The two thresholds: what survives, and who is summoned

Propagation height does more than locate a cause. It triggers two consequences at once, and — elegantly — both share a single threshold: **the line between the plan and the effort.**

The two consequences are **retention** (does this survive forward into the live record) and **attention** (is the human pulled in). Below the plan/effort line, neither; at or above it, both.

**Below the line — a plan-only redirect — is disposable.** A route failed; you re-plan. The failed attempt is archived if useful but carries nothing forward into the live work, and it needs no human attention. It was a wrong guess at *how*, and wrong guesses at how are the expected cost of doing the work. The oracle never moved.

**At or above the line — an effort, scheme, or goal redirect — is retained and attended.** The success-condition or the structure changed. This is the kind of redirect that *matters*, and the model treats it with ceremony: the superseded document is archived intact, its replacement carries an explicit `supersedes` link back to it, and the work **stops for a human decision.** Propagation past the plan layer is, by definition, a fork the human owns — because it is a change to the *meaning* of the work, not merely its mechanics.

This single threshold doing double duty is one of the model's cleaner consolidations. You do not need separate rules for "when to keep a record" and "when to involve the human." They are the same line: the moment a result implicates something above the disposable route, it both deserves to be remembered and deserves to be decided by a person.

### What survives forward, and what stays in the archive

A subtle question follows: when an upper-layer redirect happens, how much of the failure should the new work carry?

The model's answer separates two things that are easy to conflate: the **archive** and the **live chain**. The archive holds *everything* — the superseded scheme, effort, plan, artifacts, and their logs, intact and untouchable, reachable by the `supersedes` link. Nothing is lost. But what propagates *forward* into the live, current work is bounded by how high the failure climbed:

- A plan-only failure carries nothing forward but the archived attempt.
- An effort-level redirect carries forward a single distilled line: the assumption that was falsified. *Prior oracle assumed X; the result showed not-X; the oracle was revised accordingly.*
- A scheme or goal change carries that line up to the document it affects.

This resolves a real tension — *some failures are deeply informative, and yet, in the end, you only care about the successful result.* Both are true, and the archive/live-chain split honors both. The live chain reads as what-is-true-now, each current oracle annotated with the dead assumption it learned from — a clean trail of present truth, lightly footnoted with the lessons that shaped it. The failures themselves, in full, sit one archive-hop away for anyone who needs to audit *why* things are the way they are. You keep all of it; you surface only the distilled part.

The distillation — compressing a messy redirect into the single line that should propagate — is an act of interpretation, and a wrong distillation is worse than none, because it encodes a false lesson into every future oracle that inherits it. So the archiving and the link are mechanical, but **the distilled line is human-approved.** It is one of the forks the human owns, for the same reason the oracle is: it is a judgment about meaning, and meaning is not yet something to delegate.

---

## 7. The boundary with exploration

Everything above assumes you can name a concrete oracle. Sometimes you cannot — and the model is careful about where that case goes, because mishandling it is how the whole structure degrades.

There is a sibling mode, the **exploratory mode**, for genuinely exploratory work: the situation where you do not yet know what would even count as success. Its character is different. It does not declare oracles and execute against them; it runs **threads of discussion** in cycles of *open → narrow → decide → close*. It is a thinking space, a decision surface, and a record of reasoning — the place where a goal is forged before it is plannable.

The reason to keep exploration strictly *out* of the gradient-propagation mode is precisely to protect that mode's strongest property: **every effort carries a concrete oracle, no exceptions.** Efforts are always *post-oracle*. If exploratory work were allowed in, the effort layer would have to tolerate efforts without real checks, and the legibility-forcing function of the oracle — the whole point — would erode. So the rule is a clean cut: if you cannot yet name an oracle, you are not here; you are exploring.

The two modes form a **loop, not a pipeline**, and the crossing in each direction is mediated by a document that points to the artifact it justifies.

*Downward, from exploration into execution:* a discussion thread converges until it can emit a concrete oracle. That emission is the handoff. The thread closes into a record whose conclusion seeds a new effort or scheme, and that new artifact opens by citing the thread it came from. Discussion produces the oracle; gradient-propagation consumes it.

*Upward, from execution back into exploration:* when a result invalidates the oracle itself — the §5 case where the question becomes unplannable again — the honest move is to open a fresh discussion. The triggering report points to the new thread; the thread cites the report back.

This **return edge** is the piece that frameworks of this kind most often omit, and its absence is what makes them brittle. A framework that can only descend — from exploration into execution — has no legitimate path back up when a result re-opens a settled question. People then either force the re-opened question through the rigid execution machinery (corrupting the post-oracle effort layer, the exact thing the cut was meant to protect) or abandon the framework entirely. Naming the return edge is what protects the cut.

### What a plannable goal looks like

Because the boundary is defined by whether an oracle can be named, the exploratory mode has a precise terminal condition: it is over when it has produced a **plannable goal**, and a plannable goal has a definite shape. It needs an **outcome** and an **oracle**.

The outcome takes one of two forms. It is either a **claim** — an assertion about the world that could be shown false ("A predicts B out of sample") — or a **capability** — an artifact that produces a defined output ("translate A to B"). The test that you have a real outcome and not merely an activity is whether you can state what result would prove you wrong. "Find the relationship between A and B" is not an outcome; it is an activity, and it can never fail, because a relationship is always "found." It becomes an outcome only when you commit to a specific claim about that relationship — that it exists against a null, that it has a particular form, that it has a certain strength.

The oracle is matched to the outcome's form. A claim is checked by an **independent test** — held-out data, a null model, a measurement the claim does not control. A capability is checked by a **comparator** — a known-correct reference the output must match, whether reference pairs, structural invariants, or manufactured cases whose correct verdict you control by construction.

When a goal is not yet plannable, the gap is always one of three, and naming which keeps the exploration pointed rather than open-ended. The outcome may be **unclear** — still an activity, no committed claim. The comparator may be **unavailable** — the outcome is defined but no independent source is in hand. Or the oracle may be **unrunnable** — named, but not evaluable within a single increment, because it would require slow or expensive data.

The deepest discriminator — the one that decides whether a gap can be closed inside this model or genuinely belongs to exploration — is whether the unknown is one of **possession** or one of **identity.** If you know what the comparator *is* but do not yet have it, the unknown is possession: the work stays in the gradient-propagation mode, and you simply make *obtaining the comparator* the first effort, with its own cheap, immediate oracle ("the comparator now exists and is independent"). The slowness or absence of the *final* oracle does not push the goal out of the mode, as long as the comparator's identity and means of construction are known. But if you cannot yet say what would even count as the comparator — if the very definition of success is unsettled — the unknown is identity, and that is exploration's job. The discussion there is hunting not for data but for a definition, and it hands back only when the definition firms up enough that "build the comparator" becomes a nameable effort.

---

## 8. The documents and their consistency

The model is realized as a small set of documents, and the relationships among them are not incidental — they are how the abstract gradient becomes something an agent can actually navigate and a tool can actually check.

The **scheme** holds the decomposition. Each **effort** holds a ground, an outcome, and an oracle. Each **plan** holds the ordered, tests-first tasks that route to one effort's oracle. The **log** records what occurred during execution — and its unique value is everything the plan did *not* predict: the divergences, the in-flight decisions, the failures and what was tried. The plan says what was intended; the log says what happened; the gap between them is information, not embarrassment, and editing the plan to hide the gap is the corrosive move that makes a result impossible to re-enter.

The **report** closes an increment and seeds the next. It is best understood not as a form but as an **argument whose conclusion is the status.** It sums up the execution, refers to the effort's declared oracle, bridges the two with concrete indicators (the measured value, the comparison, the threshold cleared or missed), and only then flags the status — `passed`, `blocked`, `redirected`, or `escalated`. The order matters: the status is *derived* from the bridge, not asserted independently of it. A status that does not follow from its indicators is "done by assertion," which is precisely the failure the report exists to prevent. The report does not restate *how* the oracle is validated — that is the oracle's own, in the effort — it supplies the *evidence that the declared check was run and what it returned*, which is the one thing that did not exist before execution.

Two further document surfaces track state, and the discipline between them is important. **Indexes** are the mechanical index of work-document frontmatter, including each report's verdict-bearing `status`, written *only* by a sync tool, never by hand. Because they are derived, they cannot disagree with reality; a hand-edit that contradicts a source report is, by definition, a defect. **`jobs`**, by contrast, is the live worklist — intent, priorities, what to do next — authored by human and agent, carrying functions that a derived index cannot. The split keeps the worklist writable and human-meaningful while keeping the indexes honest by making them derivable from source documents.

Underneath all of this is a single property the model is meant to guarantee:

> The documents form a consistent, addressable, reciprocally-linked graph whose summary view is derived, never authored.

Every cross-document reference resolves to a real document, and is reciprocated — a forward link with no back-reference is a half-built edge, and the upward, return-path traversal silently degrades without it. Each addressable thing has a stable identity (typically the file itself, under a naming convention; an in-document identifier only when something addressable lives inside a larger file). The summary of state is computed, not maintained by hand. When these hold, the *chain of trust* the model is named for stops being aspirational and becomes mechanical — something a validator can check, rather than something everyone has to remember to honor.

But the machinery has a deliberate limit, and the limit is the same one that runs through the whole model. The graph's consistency is *referential* — it can verify that a link exists, that an index entry matches its source, that an archive is present. It cannot verify that a redirect was placed at the right layer, that an oracle pins success rather than restating the route, or that a distilled lesson is the right lesson. Those are *semantic* judgments, and the model does not pretend to mechanize them. They are the forks the human owns. The machinery exists precisely so that human attention is spent only on them — not on bookkeeping, which is automated, but on meaning, which is not.

---

## 9. The shape, in one view

The model, compressed:

A goal that is clear but revisable is held across three layers of decreasing stability — **scheme** (structure, stable), **effort** (success-condition, rolling), **plan** (route, disposable). Work proceeds in increments: declare the next oracle, route to it, execute while logging, evaluate, report. A result is placed at the lowest layer that accounts for it and rises only as far as it must; the height it rises decides both whether it survives into the live record and whether a human is summoned, and the threshold for both is the line between the disposable route and the meaningful success-condition. Everything is archived, never overwritten; only the distilled lessons travel forward into the live chain. Genuinely exploratory work, where no oracle can yet be named, lives in a sibling mode and hands an oracle across when one is forged — and the work hands the question back when a result dissolves it. The documents form a checkable, reciprocally-linked graph whose state-summary is derived, so that the only thing left for human judgment is meaning: whether the structure is sound, whether the oracle is honest, whether the lesson is true.

The model's single conviction, underneath all of it: **trust is a property of process, not of appearance.** A result is trustworthy not because it reads well, but because each step from goal to result was checked against a stated condition, recorded, and defended in proportion to how much the result will be relied on. The gradient is how that defense is organized; propagation is how surprise is absorbed without losing the trail; the human owns the meaning while the machine owns the bookkeeping. That is the whole model.
