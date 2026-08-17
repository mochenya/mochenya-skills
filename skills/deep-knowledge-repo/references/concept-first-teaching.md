# Concept-First Teaching

Use this reference for a textbook-level lesson, a foundational concept, or a mechanism whose terminology can create hidden learning gaps.

## Teaching Objective

Teach the concepts a learner needs before expecting the learner to ask for them. Do not begin with API calls, a list of features, or a colloquial analogy when the underlying model is still missing.

## Build the Concept Map First

Before prose, list the terms required to explain the topic and draw their meaningful relations. Keep the map small enough to support one central mechanism.

For example, an async lesson may need this relation before discussing `await`:

```text
coroutine function -> creates -> coroutine object -> is an -> awaitable
Task -> schedules and observes -> coroutine object
Task and Future -> are -> awaitable
event loop -> drives -> Tasks and callbacks
```

The map announces the vocabulary; it does not replace definitions. Introduce and define each primary term before using it to explain another primary term.

## Anchor Core Terminology

On the first explanatory use of each primary, necessary prerequisite, backbone, or bridging term in an independent document, write `英文正式术语（规范中文译名：准确、简炼地定义它是什么）`. When the concept has a natural syntax, type signature, command, data shape, pseudocode form, or state representation, show that minimal real expression near the definition. After the anchor is established, default to the Chinese term; use `中文名（English term）` only when comparison, disambiguation, retrieval, or emphasis requires it.

The naming line establishes the term and its definition. It does not replace the later explanation of motivation, role, mechanism, boundaries, or verification.

## Classify Dependencies

- **Primary concept**: The lesson must fully teach it.
- **Necessary prerequisite**: Give the smallest accurate review needed for this lesson.
- **Declared prerequisite**: State the dependency, why it matters, and where to learn it.
- **Extension**: Mention only after the central model is complete.

Do not make a learner discover a missing dependency by failing to understand an unexplained sentence.

## Explain Each Primary Concept

Use the concept six questions:

1. What is it?
2. Why is it needed?
3. What role does it play in the system?
4. How does it behave over time or state changes?
5. What is it not, or what is commonly confused with it?
6. How can the learner verify the claim?

Use a formal definition first. Add one precise intuition only when it reduces cognitive load, then return to the technical model. Avoid filler, repeated restatements, and analogies that cannot be mapped back to the mechanism.

## Make Gaps Visible

Place a `核心概念地图` and `最小前置知识` section near the start. End with diagnostic self-check questions. Each answer should identify the relevant concept or note, not merely say “review this chapter.”

## Standalone Lesson Contract

An independent lesson must state its problem, intended outcome, terminology, necessary prerequisites, representative example, execution trace, rules, boundaries, and verification. It may link to deeper notes, but it must not require the reader to have the previous conversation open.
