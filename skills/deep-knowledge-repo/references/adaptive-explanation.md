# Adaptive Explanation

Adapt the entry point to the learner without changing the central concept map.

## Use the Current Request Only

Use background stated in the current request or repository learning goal. Do not persist a personal mastery score, misconception history, or learner profile in durable notes. Notes remain reusable by declaring their own minimum prerequisites.

## Beginner Topic Mode

- Define every primary concept and every necessary prerequisite.
- Use one complete example with an explicit execution trace.
- Explain syntax only when it carries the mechanism.
- Add more diagnostic self-check questions.

Use this mode for one focused topic. Do not stretch its single representative example across a multi-unit or zero-background course.

## Zero-Background Curriculum Mode

Read [foundational-course.md](foundational-course.md). Build the course coverage matrix and prerequisite graph before lessons. Teach every required syntax form and course-relevant operation at an explicit point, then use a progression of minimal shape, prediction, execution trace, worked example, boundary variation, guided modification, and independent practice as the topic warrants.

Do not use advanced syntax merely to make an early example convenient. When borrowing a later construct is unavoidable, label it, explain the smallest reading rule, and do not test it in the current lesson.

## Experienced Mode

- Keep the same primary concept map and definitions.
- Put familiar material in a concise `快速回顾` section.
- Spend most prose on mechanism, surprising behavior, boundaries, and engineering consequences.
- Do not replace a definition with “as you know.”

## Deep-Dive Mode

- Keep a compact definition and relation map.
- Add formal semantics, implementation observations, trade-offs, source-level evidence, or performance implications only when they clarify the target question.
- Clearly distinguish language guarantees from one implementation's behavior.

## Default When Background Is Unknown

Assume the reader needs the concept map and accurate definitions, but avoid a full basic-syntax course. Make the first obstacle visible, explain it, and let the reader request a deeper prerequisite branch.

This default does not apply when the request explicitly asks for a foundational, zero-background, personalized, or textbook-style course; use Zero-Background Curriculum Mode instead.
