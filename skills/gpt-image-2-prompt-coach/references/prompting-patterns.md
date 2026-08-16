# GPT-Image-2 Prompting Patterns

Use this reference to ground prompt-writing decisions in the local OpenAI cookbook guide:

https://developers.openai.com/cookbook/examples/multimodal/image-gen-models-prompting-guide.md

This file distills the guide's prompt-writing advice. It intentionally omits API setup and invocation details because this skill is only for visual description.

## Contents

- Core model
- Generation pattern
- Edit pattern
- Text in images
- References and multi-image workflows
- Style and realism
- Iteration
- Common failure modes

## Core Model

Treat a prompt as a production brief. Define the goal, then describe the scene, subject, details, and constraints in a skimmable order. Minimal prose, labeled sections, instruction-style prose, and JSON-like layouts can all work; clarity and maintainability matter more than syntax.

Use concrete visual facts:

- materials, shapes, surfaces, textures, and object relationships
- framing, viewpoint, angle, scale, placement, and negative space
- pose, gaze, expression, body extent, and interactions for people
- medium, palette, lighting direction, atmosphere, and realism level

For a photorealistic result, include photorealistic and add natural lighting, believable materials, real texture, and small imperfections when appropriate. Use camera language for high-level composition and look, not for brittle claims about exact physical simulation.

## Generation Pattern

Start with the deliverable and intended use. Then specify:

1. Scene and setting.
2. Subject and distinctive details.
3. Action, pose, gaze, and interactions.
4. Composition, viewpoint, and lighting.
5. Style or medium and material behavior.
6. Exact text and typography, if any.
7. Targeted constraints and exclusions.

Intended use helps set the design mode: an ad, product catalog image, classroom handout, UI mockup, pitch slide, and story illustration need different levels of polish and hierarchy.

## Edit Pattern

Write edits as controlled transformations:

~~~text
Change only [X].
Preserve [identity, geometry, layout, camera, lighting, labels, and other invariants].
Match [perspective, scale, shadows, color temperature, and material behavior].
Do not add [unrequested elements, text, logos, or watermarks].
~~~

Repeat important invariants on every iteration. For surgical edits, explicitly protect saturation, contrast, arrows, labels, surrounding objects, and camera framing when they must not move.

## Text in Images

Treat text as exact data, not a theme:

~~~text
Include ONLY this text, verbatim:
"[exact copy]"

Typography: [font character, weight, size, color, contrast, alignment, placement].
Render it once, legibly, with no extra characters.
~~~

For dense text, small labels, diagrams, charts, or multi-font layouts, use a strict prompt and expect to iterate. Keep copy short when the design allows it.

## References and Multi-Image Workflows

Index every input:

~~~text
Image 1: [base scene or person].
Image 2: [object, clothing, or style reference].
Apply [specific element or visual language] from Image 2 to Image 1.
Preserve [the exact elements that must remain from Image 1].
~~~

For compositing, name what moves, where it goes, and how perspective, scale, lighting, shadows, and occlusion should match. For character continuity, maintain a reusable anchor containing appearance, proportions, outfit, expression, palette, and personality cues.

## Style and Realism

Describe style as controllable signals:

- palette and contrast
- light quality and direction
- surface or brush texture
- depth, atmosphere, and composition
- material and edge behavior

For natural photography, prefer candid, grounded, unretouched cues over generic cinematic polish. For style transfer, say which visual language stays and which subject or scene changes.

## Iteration

Begin with a clean base prompt. Refine with small deltas such as:

~~~text
Make the light warmer.
Remove the extra object on the left.
Restore the original background. Keep all other changes.
~~~

Do not overload one revision with unrelated changes. Re-state critical invariants whenever drift is likely.

## Common Failure Modes

- Abstract style words without observable visual evidence.
- Vague placement such as "somewhere in the background."
- A requested edit without a preserve list.
- Multiple input images without indices or element relationships.
- Text requested without exact copy and typography constraints.
- Generic negative-word lists that do not identify a concrete failure.
- Overlong prompts containing repeated adjectives and contradictory directions.

Keep prompt content separate from runtime configuration. This skill is deliberately limited to visual description and prompt quality.
