# Note Quality Contract

Use this contract for every substantial topic. Default to concise prose. Add length only when the topic is foundational, cross-cutting, easy to misunderstand, or likely to affect later engineering decisions.

## Required Questions

1. What problem does the concept solve?
2. What mental model explains it?
3. What is the lifecycle, execution order, or state transition?
4. Which invariants must always hold?
5. What are the smallest examples that prove the behavior?
6. Which edge cases and failure modes matter?
7. How is it used in real systems?
8. When should it not be used?
9. Which nearby concepts are easy to confuse with it?
10. How can the claims be verified with code, tests, a source trace, or a reproducible observation?

## Concept Completeness Gate

Before marking a teaching note complete, identify its primary concepts and verify each one has:

1. an accurate definition that distinguishes it from nearby terms;
2. a motivation explaining which problem or limitation made the concept necessary;
3. a role in the current system or mechanism;
4. a lifecycle, state transition, or operational rule when applicable;
5. a boundary, non-example, or common confusion;
6. a concrete way to observe or verify the claim.

Links may extend the topic, but they cannot replace any item required to understand the current central mechanism. The note must make hidden prerequisites visible before relying on them.

## Depth Levels

- `overview`: vocabulary, purpose, and links; suitable for an index or first contact.
- `working`: mechanism, examples, common errors, and one experiment.
- `deep`: lifecycle, invariants, implementation details, trade-offs, failure modes, and multiple experiments or a project application.

Do not enforce a fixed word count. Stop when the reader can predict behavior, explain the reason, identify the boundary, and verify the claim. Split the note when it begins to introduce a second independent mechanism.

## Engineering Topics

For architecture, libraries, or operational practices also record:

- ownership and responsibility boundaries;
- dependency direction and replacement points;
- transaction, concurrency, or resource boundaries;
- testing strategy and observability;
- scaling limits and migration cost;
- simpler alternatives and signs of over-engineering.

## Review Checklist

- The title names one primary topic.
- Frontmatter has `title`, `type`, `status`, `level`, and `tags`.
- At least one upstream or prerequisite link exists, unless the topic is foundational.
- At least one downstream application, experiment, or project is linked when applicable.
- Claims that depend on versions or implementations include a source or version note.
- Code is runnable, has expected output, or is explicitly marked as pseudocode.
- Standalone code contains a module-level purpose, meaningful names, focused functions, and comments for intent or non-obvious behavior rather than syntax narration.
- The code follows the target language's normal formatting and error-handling conventions unless a deliberate deviation is the subject of the experiment.
- The note does not merely paraphrase API documentation.
- Primary terminology is defined before use with the English formal term first, the normative Chinese term, and an accurate “what it is” definition; a minimal real expression is shown nearby when one naturally exists. Self-check questions can reveal which concept a reader still needs to revisit.
