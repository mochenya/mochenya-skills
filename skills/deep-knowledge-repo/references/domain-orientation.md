# Ordered Domain Orientation

Use this contract when a learner enters a new or broad subject, requests a high-level map, or when an existing orientation has degraded into an unconnected glossary.

## Purpose and Non-Goal

A domain orientation gives the learner names, boundaries, mechanism families, dependency paths, difficulty signals, and future learning entrances. It changes unknown unknowns into visible questions.

It is not a compressed textbook. A core mechanism that normally needs a full lesson must not be presented as mastered after a one-line definition. Give the smallest accurate preview, connect it to the mechanism path, and defer full execution, edge cases, experiments, and engineering trade-offs to a deep topic dossier.

## Trigger Gate

Create or substantially revise an orientation when one of these is true:

- the repository is new or empty;
- the learner is entering a broad subject from little or no background;
- the request asks what concepts, mechanisms, difficulties, or advanced capabilities the subject contains;
- an existing map omits central mechanism families or presents them without dependency and sequence;
- the subject boundary or intended engineering direction has materially changed.

Skip full orientation work for a narrow concept question, a local experiment, an index rebuild, or an existing map that already covers the requested scope.

## Build the Graph Before the Prose

1. Define the domain boundary and distinguish neighboring layers such as language, runtime, host platform, libraries, tooling, and engineering practice.
2. Identify the major mechanism families.
3. For each family, list the concepts needed to explain one representative mechanism.
4. Draw labeled relations such as `creates`, `schedules`, `drives`, `stores`, `resolves`, `narrows`, `transforms`, or `recovers`.
5. Choose the path that best explains the family: lifecycle, control flow, data flow, state transition, causal chain, or prerequisite order.
6. Linearize that path so every concept is defined before it is used.
7. Keep secondary branches visible without interrupting the central trace.

Do not use alphabetical order or API categories when they hide the mechanism.

## Concept Roles

- **Backbone concept**: forms a state or transition on the central path. Introduce it in sequence.
- **Bridging concept**: connects two backbone concepts. Define it before the connection depends on it.
- **Necessary derived concept**: arises from a limitation or downstream requirement of the main mechanism. Preview it and name the producing problem.
- **Contrast concept**: prevents a high-value confusion. Insert it only where the distinction changes understanding.
- **Specialized extension**: useful for a particular implementation, optimization, or engineering direction. List it after the main path.

These roles organize orientation depth. They do not replace the primary/prerequisite/extension classification used for a deep lesson.

## Minimum Explanation Contract

On first introduction of a backbone or bridging concept:

1. use `英文正式术语（规范中文译名：准确、简炼地定义它是什么）`;
2. show a minimal real expression nearby when the concept has a natural syntax, type signature, command, data shape, pseudocode form, or state representation;
3. use the following one to three sentences to distinguish it from nearby concepts;
4. state why it appears at this point in the mechanism and connect it to the previous and next concept;
5. name one important boundary when omitting it would create a false model.

For example:

```text
type predicate（类型谓词：函数返回类型中形如 `value is T` 的类型标注，表示函数返回 `true` 时，TypeScript 将 `value` 视为 `T`。）
```

The naming line establishes the English name, Chinese name, accurate definition, and observable form. Keep motivation, mechanism, relations, and boundaries in the following prose instead of forcing them into the parenthetical definition.

Do not repeat full bilingual terminology on every later occurrence. Do not give every concept the six-question deep-lesson treatment inside the orientation.

## Ordered Explanatory Form

For each mechanism family, prefer this flow:

1. **Problem**: what limitation or behavior requires explanation.
2. **Mechanism spine**: a compact labeled relation map.
3. **Sequential concepts**: short prose sections in dependency or execution order.
4. **Representative trace**: pseudocode, minimal code shape, state trace, or sequence diagram.
5. **Necessary derived branches**: each branch names the problem that produces it.
6. **Important boundaries**: a small number of misconceptions that would corrupt the map.
7. **Deep-topic entrances**: the mechanisms that require independent textbook-level notes.

Use tables for comparisons, priority summaries, or a final term index. Do not use a table as the main explanatory spine.

## Pseudocode and Code

Use one compact trace when it clarifies a whole mechanism family. Prefer pseudocode for scheduler behavior, lifecycle, storage transitions, type relations, or other abstract mechanisms whose production implementation would obscure the model.

Label pseudocode explicitly and state when it omits implementation details. Do not claim it was executed. Use real code only when the syntax itself carries the mechanism and the example remains small enough for orientation.

Do not attach a code block to every term. The trace should connect multiple concepts, not decorate isolated definitions.

## Derived-Knowledge Closure

Do not end the main path with an unexplained “related concepts” list. Express why each necessary derivative exists:

```text
main mechanism limitation
    -> creates a new requirement
    -> motivates derived concept
```

For example:

```text
an asynchronous operation may never finish
    -> requires bounded waiting
    -> motivates timeout

multiple child tasks need shared lifetime and failure handling
    -> requires structured ownership
    -> motivates structured concurrency
```

Mention enough derivatives to close the learner's map, not every ecosystem API.

## Representative Example: Python Async

An orientation should not list event loop, coroutine, awaitable, Task, and Future as independent rows. Build their relations first:

```text
async def
    -> defines -> coroutine function

calling a coroutine function
    -> creates -> coroutine object
    -> is an -> awaitable

create_task(coroutine object)
    -> schedules -> Task
    -> is a -> Future
    -> is an -> awaitable

event loop
    -> drives -> Tasks and callbacks

await awaitable
    -> suspends current coroutine when incomplete
    -> returns control to the scheduler
    -> resumes after completion
```

Then explain those terms in the order required by a representative execution. Preview timeout, cancellation, TaskGroup, exception propagation, and async iteration only after the central suspend-and-resume model is established.

## Storage and Navigation

- Use `docs/00-index/领域全景.md` for the concise, human-curated subject view.
- Put substantial mechanism-family maps in `docs/topics/<subject-foundations>/`.
- Link the domain orientation to the current learning path, mechanism-family maps, and first deep topic.
- Keep future deep topics as plain text until their notes exist, unless the vault explicitly permits planned unresolved links.

## Quality Gate

Before accepting an orientation, verify:

- subject boundaries and layers are explicit;
- central mechanism families are present;
- each family has a labeled mechanism spine;
- every concept is defined before it is depended upon;
- transitions explain why the next concept is needed;
- core terminology first appears in explanatory text as `英文正式术语（规范中文译名：准确、简炼地定义它是什么）`, with a minimal real expression nearby when one naturally exists;
- bridging concepts close the main mechanism rather than being silently assumed;
- necessary derived concepts name their motivating problem;
- a representative trace makes the central path predictable;
- tables support comparison or indexing rather than replace the narrative;
- deep mechanisms are marked for later independent study;
- priorities, bottlenecks, advanced capability criteria, and the first learning step are visible.

## Failure Modes

- A flat glossary whose rows have no causal, lifecycle, data-flow, or dependency relation.
- A feature checklist ordered by API category instead of mechanism.
- A large table that forces complex concepts into one-line cells.
- Definitions that use a later concept before introducing it.
- A “related concepts” section that names derivatives without explaining why they arise.
- Pseudocode for every term, producing visual noise without a representative trace.
- A compressed textbook that treats ten deep mechanisms superficially in one note.
- A roadmap that gives order but never exposes what advanced understanding means.

