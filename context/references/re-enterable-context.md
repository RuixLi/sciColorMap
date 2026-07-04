# Re-enterable context

`context/` is a project's durable working memory, and its job is **cold re-entry**: any reader who has lost the thread - a compacted agent, a new model, a human returning weeks later - can reconstruct *where things stand* and *how it got here* from `context/` alone, and continue without the original session. This is the reference `building-context` leans on for the *why*; `tree-graph-filesystem` supplies the structural mechanics, `work-documents` the vocabulary, `tracking-progress` the state surface. It is a conceptual shape, not itself a checkable rule.

## Why it exists

Memory is the thing an agent cannot keep. A session is compacted, a new session starts cold, a different model picks up the work - and the reasoning, the decisions, and the dead ends are gone. A human collaborator forgets across weeks the same way. Chat is not a record: it is not addressable, not durable, and not shared. Without a durable memory outside the session, work cannot be *continued* (you restart instead of resume) and cannot be *trusted* (you cannot say how a result was reached). `context/` is that memory, and everything in it earns its place by serving re-entry.

## Re-entry reconstructs two things

A reader arriving cold needs two distinct things, and confusing them is the usual failure:

- **Where things stand** - the current state, reachable *without* reading history: what is in flight, its cycle state, and the next action. This is the *now* view - the jobs board for a human, the derived indexes for an agent.
- **How it got here** - the trail, reconstructable *on demand*: the effort that declared the oracle, the plans that routed to it, the log of what happened, the report that carried the verdict, and the archive of what was superseded. This is the *history* view, reached only when the *now* is not enough.

Keeping the two apart is what lets re-entry be cheap: a reader should learn where things stand without replaying how they got there.

## The re-entry path is layered

Re-entry descends through layers, and a reader stops at the shallowest one that answers the question:

    door       AGENTS.md               what is this project, where do I look
    orient     jobs / indexes          where things stand now
    descend    effort / plan / report  the unit I am continuing
    history    log / archive           how and why it came to be

The door names the project and points inward; the orient layer answers *where things stand*; the reader descends to the one unit it is continuing; and it reaches history only for *why*. Cold re-entry must never require reading everything - a memory you have to read in full to use is not a working memory, it is a transcript.

Re-entry is usually **scoped to one effort**, not the whole repository - a fresh session is assigned an independent piece and does not need the state of unrelated work. So the orient layer's job is to *route* a reader to its slice, from which the depth it needs is that one effort's own leaves. A thin surface that routes well is the design, not a shortfall: the situation view stays small because each reader needs only its own.

## What makes each layer trustworthy for re-entry

The layers support re-entry only if a reader can trust what each one says. Four properties do that, each owned by another part of the framework and only relied on here:

- **The live chain reads as now-truth; the archive is one hop away.** The current, non-superseded documents *are* the present state; a superseded one is archived intact behind a `supersedes` link. So the *orient* and *descend* layers can be read as true-now without auditing history, while the *why* stays one hop away (`how-to-work-here`, `gradient-propagation-workflow`).
- **Leaves self-describe; summaries are derived.** Each leaf carries its own state in its header, and the *orient* surface is generated from those headers - so the "where things stand" view cannot silently disagree with its leaves (`tree-graph-filesystem`, `document-frontmatter`).
- **Two surfaces over one memory.** A human re-enters through the jobs board and prose; an agent through frontmatter and derived indexes. Both read the same leaves underneath - the surfaces differ, the state is not duplicated (`writing-for-the-user`, `tracking-progress`).
- **Links resolve and reciprocate.** The path holds only if every hop lands on a real document and the return hop exists; a half-built edge silently breaks the upward, history-ward traversal a reader depends on (`tree-graph-filesystem`).

## What it implies

- **`building-context`** owns the checkable requirement this model motivates - that the door and the memory behind it are actually re-enterable - and points to the conventions below for the mechanics rather than restating them.
- **`tracking-progress`** owns the *orient* surface (authored `jobs`, derived indexes); **`where-files-live`** owns the tree the memory lives in; **`how-to-work-here`** owns the archival that keeps the live chain now-true; **`work-documents`** names the leaves; **`writing-for-the-user`** shapes each leaf for its reader.
- Whether a memory is *genuinely* re-enterable - whether a fresh reader really can continue from it - is a semantic judgment, checked by reading, not by a link validator. That residue is the human's, the same as everywhere else in the framework.

A reference is referenced by a convention; it adds no independent requirement of its own.
