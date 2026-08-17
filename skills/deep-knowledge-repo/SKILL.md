---
name: deep-knowledge-repo
description: Build and maintain subject-focused, deep-learning knowledge repositories in Obsidian Markdown. Use when initializing or orienting a learner in a new computer-science subject, mapping core mechanisms and derived concepts in a meaningful order, turning a requested concept into a durable topic dossier, linking mechanisms to engineering practice, or rebuilding live topic indexes without imposing fixed chapters.
---

# Deep Knowledge Repository

Build a growing knowledge graph around user-selected topics. Treat chapters as generated navigation views, not as the source structure. Support both first-contact orientation and textbook-level mechanism study without confusing those two depths.

## Operating Model

- Store durable knowledge as topic dossiers under `docs/topics/`, not fixed chapter folders.
- Use `[[wikilinks]]` for relationships between notes and ordinary Markdown links for external sources.
- Maintain three navigation views when the subject is broad: a human-curated domain orientation, an automatically rebuilt topic catalog, and a human-curated current learning path.
- Build an ordered domain orientation before the first deep topic when the learner is entering a new or broad subject.
- Present orientation as a guided mechanism map, not a flat glossary and not a compressed textbook.
- Keep short concepts in one note; split complex topics into mechanism, engineering, pitfalls, experiments, and project notes.
- Use frontmatter to describe subject, type, level, status, prerequisites, related topics, and applications.
- Keep executable evidence in `code/` or `experiments/`; keep integrated work in `projects/`.
- Treat a complex topic dossier as a small textbook unit. Use links to extend understanding, never to replace a definition or mechanism required by the current note.
- Teach core concepts before API usage. Do not rely on the learner to identify missing terminology or hidden prerequisites.
- Anchor each core technical term on its first explanatory use in an independent document with `英文正式术语（中文规范译名：准确、简炼地定义它是什么）`. When the concept has a natural code shape, type signature, command, data structure, pseudocode form, or state representation, show that minimal real expression near the first definition. After the anchor is established, default to the Chinese term and use `中文名（English term）` only when comparison, disambiguation, retrieval, or emphasis requires it.

## Workflow

### 1. Inspect Before Writing

Read the repository's existing `README.md`, `docs/00-index/学习目标.md`, `docs/00-index/领域全景.md` when present, templates, and current topic files. Preserve existing notes and adapt to their conventions. For an empty repository, infer the subject, audience, depth, and initial goal when the request makes them clear; ask only when a missing choice would materially change the repository.

### 2. Establish the Learning Contract

Create or update `docs/00-index/学习目标.md`. Record the subject, prior knowledge, desired depth, preferred emphasis, and what counts as mastery. Do not encode a fixed chapter sequence in this file.

### 3. Classify the Request Scale

Choose the smallest workflow that satisfies the request:

- **domain orientation**: a new repository, a learner entering a broad subject, or a request for a systematic high-level map;
- **topic dossier**: one coherent concept or mechanism that needs durable explanation;
- **experiment or project**: executable verification or integrated practice;
- **navigation maintenance**: repairing links, indexes, or the current route.

Do not regenerate an entire domain orientation for a narrow topic request. Reuse an existing orientation unless the subject boundary, learning goal, or mechanism map has materially changed.

### 4. Orient a New or Broad Subject

Read [domain-orientation.md](references/domain-orientation.md) and use [domain-orientation.md](assets/templates/domain-orientation.md) as a deletable template.

Before creating the first deep topic:

1. Define the subject boundary and separate language, runtime, platform, tooling, and engineering layers when relevant.
2. Identify mechanism families and build their concept dependency graphs.
3. Select a representative lifecycle, control flow, data flow, state transition, or causal path for each family.
4. Order the explanation so every required concept is defined before it is used.
5. Introduce each backbone or bridging concept with `英文正式术语（规范中文译名：准确、简炼地定义它是什么）`. Prefer a minimal real expression such as syntax, a type signature, a command, a data shape, pseudocode, or a state transition when one exists; explain its relation to the previous and next steps outside the naming line.
6. Use a compact pseudocode trace, relationship diagram, or minimal code shape when it materially clarifies the whole mechanism family.
7. Name necessary derived concepts and state which limitation or downstream problem produces them.
8. Separate foundational, core, advanced, and specialized material without implying that specialized trivia defines mastery.
9. State the major bottlenecks, high-value confusions, advanced capability target, and first deep topic.

Store the high-level navigation view at `docs/00-index/领域全景.md` when the repository covers a broad subject. Put substantial mechanism-family maps in stable topic dossiers under `docs/topics/` and link them from the orientation.

Do not present the main explanation as a table of unrelated terms. Use tables only for real comparisons, priority summaries, or compact indexes after the ordered narrative is established. Do not pretend that a minimum definition fully teaches a core mechanism; point to a future deep topic.

### 5. Audit Concepts for a Deep Topic

Before outlining a teaching topic, identify its conceptual dependency graph. Classify every needed term as one of:

- **primary concept**: teach fully in the current unit;
- **necessary prerequisite**: define or give a minimal review before depending on it;
- **declared prerequisite**: name the required prior knowledge and link to it after stating why it is needed;
- **extension**: defer to a related note without interrupting the main mechanism.

For every primary concept, establish its definition, motivation, role in the system, mechanism or lifecycle, boundaries, and verification. Surface this map near the start of the teaching note. Never omit a primary concept because a learner claims prior experience; adjust review density, not conceptual coverage.

### 6. Create a Topic Dossier

For a new topic, create a stable topic directory such as `docs/topics/asyncio-event-loop/`. Start with `00-主题入口.md`, then add only the supporting notes justified by complexity:

- core model and vocabulary;
- runtime or implementation mechanism;
- engineering patterns and trade-offs;
- pitfalls, failure modes, and non-goals;
- runnable experiments;
- projects or production applications;
- related and contrasting topics.

Use the templates in `assets/templates/` and load [note-quality.md](references/note-quality.md) when writing a deep explanation.

### 7. Build Durable Understanding

Every substantial topic must explain the problem, mental model, lifecycle or execution order, invariants, examples, edge cases, engineering use, anti-patterns, and verification evidence. Explain why a design works, not only which API to call. Include version or source context when behavior may vary.

Keep prose concise by default. Increase depth only when the topic is foundational, cross-cutting, easy to misunderstand, or important to later engineering decisions. In those cases, expand the execution trace, comparison, counterexample, and experiment until the mechanism is clear; do not add length merely to fill a template.

Write each note so a reader can learn the central mechanism without the previous chat or an unstated earlier note. Begin with the problem, define required terminology on first use, show the concept map, trace a representative example, and end with self-check questions that point to the missing concept when unanswered.

### 8. Adapt Without Hiding Concepts

Use the learner's stated background only to decide how much prerequisite review, syntax explanation, and execution tracing to include. Preserve the same primary concept map for beginners, experienced learners, and deep-dive requests. Do not persist a personal mastery profile in notes; make each note independently useful through an explicit `最小前置知识` section and optional `快速回顾` material.

### 9. Write Code as a Standalone Explanation

Treat executable examples as small teaching modules, not fragments pasted into a note:

- include a concise module-level purpose and the question being tested;
- use the target language's normal naming, formatting, entry-point, and error-handling conventions;
- add type annotations when they clarify the contract without distracting from the mechanism;
- comment intent, mechanism, expected observation, or a non-obvious boundary rather than obvious syntax;
- write comments and reader-facing output in the repository's primary language while preserving official identifiers and APIs;
- label intentionally incorrect code next to the line that demonstrates it;
- print stable, labeled observations and explain them in the companion note;
- run every new executable example and record expected versus actual output.

Orientation pseudocode is exempt from execution only when it is explicitly labeled as pseudocode and does not claim implementation completeness.

### 10. Link and Update Navigation

Use explicit sections or frontmatter for `prerequisites`, `related`, `contrasts`, `implemented-in`, and `used-in`. Tags classify notes; links express relationships. Keep tags small and hierarchical, normally three to five per note. Add links to both upstream concepts and downstream applications.

Run `scripts/build-topic-index.ps1` after adding or renaming topics. It rebuilds `docs/00-index/主题总索引.md` from frontmatter. Update `docs/00-index/领域全景.md` when the domain map changes. Update `docs/00-index/当前学习路径.md` only when the learner's present study order changes; do not overwrite either curated view with generated output.

### 11. Verify the Result

Check that frontmatter is valid, internal links resolve, code is runnable or clearly marked pseudocode, and the topic is not an orphan. Use callouts for warnings, key invariants, and open questions. Use Mermaid only when a lifecycle or relationship diagram materially improves understanding.

For a domain orientation, also verify:

- the main mechanism families form ordered explanatory paths rather than a flat glossary;
- each concept is defined before another explanation depends on it;
- transitions explain why the next concept is needed;
- backbone, bridging, necessary derived, contrast, and specialized concepts are not silently conflated;
- necessary derived concepts name the problem or limitation that produces them;
- at least one representative trace makes each central mechanism family predictable;
- core terminology first appears in explanatory text as `英文正式术语（规范中文译名：准确、简炼地定义它是什么）`, with a minimal real expression nearby when one naturally exists;
- full mechanism study is deferred to explicit deep-topic entries;
- the orientation ends with a usable learning route and first deep topic.

For a textbook-level note, also verify that every primary term is defined before use, every necessary relation is explained rather than only linked, one representative execution can be predicted from the text, and self-check questions expose likely knowledge gaps.

## Subject Adaptation

Keep the workflow subject-neutral. Adapt mechanism families and sequencing to the subject:

- Python: execution model, data model, functions and scope, objects and protocols, typing, async runtime, packaging, architecture;
- PostgreSQL: request path, parsing and planning, execution, storage, indexes, MVCC, transactions, WAL and recovery, operations;
- Java: language model, type system, JVM loading and execution, memory model, concurrency, packaging and service design;
- Rust: values and ownership, borrowing, lifetimes, traits, memory layout, async runtimes, unsafe boundaries and packaging.

Do not force subjects into a common chapter list. Choose an order that follows real dependency, lifecycle, control flow, data flow, or state transition.

## Resources

- Read [domain-orientation.md](references/domain-orientation.md) when initializing a subject, building a high-level map, or revising an orientation that has become a flat list.
- Read [note-quality.md](references/note-quality.md) for the deep-note quality contract and review rubric.
- Read [code-quality.md](references/code-quality.md) when adding runnable examples or experiments.
- Read [concept-first-teaching.md](references/concept-first-teaching.md) before writing a textbook-level topic or explaining a mechanism with hidden prerequisites.
- Read [adaptive-explanation.md](references/adaptive-explanation.md) when the learner states a background level or when choosing prerequisite density.
- Read [metadata-schema.md](references/metadata-schema.md) for frontmatter fields.
- Read [relationship-model.md](references/relationship-model.md) when adding or repairing graph edges.
- Copy templates from `assets/templates/`; use `domain-orientation.md` for broad first-contact maps and `textbook-lesson.md` for foundational deep topics.
- Run `scripts/init-knowledge-repo.ps1` for a new repository and `scripts/build-topic-index.ps1` to rebuild the catalog.

