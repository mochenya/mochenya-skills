# Foundational Curriculum Contract

Use this contract when creating or repairing a zero-background, personalized, textbook-style, or multi-unit course. It governs course sequencing, focused lesson design, operation coverage, examples, practice, and course-level validation. It does not replace the domain-orientation or deep-topic contracts.

## Contents

- [Purpose and non-goals](#purpose-and-non-goals)
- [Personalize the learning contract](#personalize-the-learning-contract)
- [Build the curriculum graph before lessons](#build-the-curriculum-graph-before-lessons)
- [Separate course artifact responsibilities](#separate-course-artifact-responsibilities)
- [Control lesson granularity and prerequisite leakage](#control-lesson-granularity-and-prerequisite-leakage)
- [Connect concepts, syntax, operations, and mechanism](#connect-concepts-syntax-operations-and-mechanism)
- [Cover methods and APIs as usable contracts](#cover-methods-and-apis-as-usable-contracts)
- [Use an example and practice ladder](#use-an-example-and-practice-ladder)
- [Write comments and outputs for learning](#write-comments-and-outputs-for-learning)
- [Define observable mastery](#define-observable-mastery)
- [Store and navigate the course](#store-and-navigate-the-course)
- [Validate before expanding the course](#validate-before-expanding-the-course)

## Purpose and Non-Goals

A foundational curriculum turns an explicit learner starting point into an ordered path of concepts, operations, runnable evidence, practice, and mastery gates. It should let a learner study from the durable artifacts without the original chat.

The quality target may resemble a polished official course, but the resulting material must not claim official endorsement. Use current specifications and authoritative documentation to establish technical facts, then reorganize them for learning instead of paraphrasing a reference manual.

A foundational curriculum is not:

- a domain orientation expanded with more words;
- a fixed number of large chapter files;
- a fixed number of small lesson files per unit;
- an API catalogue without a mechanism or task spine;
- one integrated example asked to introduce every prerequisite at once;
- a personal score log or persistent misconception profile;
- proof of mastery merely because every example ran successfully.

Document count is an output of the knowledge structure, never a quality target. A short introductory unit may need one substantial document; a dense unit with several independent mechanisms may need several. “Eight lessons per unit,” “one method per note,” and “one heading per file” are all invalid decomposition rules.

## Personalize the Learning Contract

Record stable choices in `docs/00-index/学习目标.md` or the repository's equivalent learning-contract note:

- target subject and explicit boundary;
- starting knowledge and assumed missing prerequisites;
- target capability and intended engineering direction;
- language, runtime, platform, tooling, and version policy;
- preferred explanation density, terminology style, and practice emphasis;
- what counts as mastery;
- what is intentionally deferred.

Personalization changes scope, order, prerequisite review, syntax density, execution tracing, examples, and practice. It must not change formal definitions or silently remove a primary concept. Keep transient mistakes, current scores, review dates, and conversation-only history out of durable topic notes.

## Build the Curriculum Graph Before Lessons

Create a curriculum coverage matrix before bulk writing. At minimum, map:

| Field | Question |
| --- | --- |
| concept or operation | What must the learner understand or be able to do? |
| role | Is it foundational, core, bridge, contrast, or extension material? |
| prerequisite | Which previously taught fact is required? |
| first teaching location | Which focused lesson defines and explains it? |
| later reuse | Where will the learner apply it again? |
| evidence | Which runnable observation or trace demonstrates it? |
| practice | Will the learner predict, modify, implement, debug, compare, or choose? |
| mastery gate | What observable performance allows progression? |
| source context | Which specification or authoritative documentation establishes the claim? |

Then build a labeled prerequisite graph. Linearize it so that a lesson can use only:

1. material already taught;
2. material fully taught in the current lesson; or
3. explicitly marked borrowed syntax with the smallest explanation needed to read the example.

Do not treat a course unit title as either proof that it needs one file or proof that it needs many. First test conceptual cohesion. “Values, runtime types, equality, and conversion” can remain one substantial lesson when one value-model thread explains the whole sequence. Adding collections introduces a separate data-structure model and will usually justify another document.

## Separate Course Artifact Responsibilities

Use these artifact roles only when each selected artifact has a distinct responsibility:

- **course entry**: learning contract, subject boundary, ordered units, global outcomes, course-wide coverage, environment, and completion criteria;
- **unit entry**: the capability problem solved by the unit, lesson order, prerequisites, unit synthesis task, and unit completion gate;
- **focused lesson**: one central mechanism or a tightly cohesive knowledge group, with concept, syntax, operation, evidence, boundary, and practice;
- **runnable lab**: minimal executable evidence with stable output and a companion explanation;
- **integrated project**: combines only previously taught material to solve a realistic problem;
- **current learning path**: the learner's present route through stable course artifacts.

Do not automatically create every role. If a unit contains one cohesive lesson, let that lesson carry the unit outcome, practice, and completion gate. Create a separate unit entry only when it coordinates multiple lessons, labs, or a synthesis task. Do not make a separate lesson for an observation helper such as `console.log` unless using that API is itself a learning objective.

Course units are navigation views. Keep reusable mechanisms in durable topic dossiers when that improves linking and reuse; do not duplicate the same explanation merely to satisfy a chapter layout.

## Control Lesson Granularity and Prerequisite Leakage

A focused lesson normally has one central mechanism or one tightly connected concept family. Prefer one longer document when the concepts share the same motivating problem, mental model, prerequisite set, running example, and completion gate. Length alone is not a reason to split.

Keep material together when:

- later parts refine, contrast, or apply the same central model;
- the same example can reveal each part without introducing a second lifecycle;
- splitting would repeat definitions, setup, or boundary explanations;
- one completion task naturally tests the combined capability;
- a construct is only an observation or demonstration tool, not a learning objective.

Split the lesson when:

- a second mechanism needs a different mental model or lifecycle;
- the example requires several untaught syntax forms;
- the self-check tests multiple unrelated abilities;
- one primary concept receives only a definition while another receives the whole trace;
- the learner could understand one branch without the other.

A long title, many headings, or several methods are only review signals, not split criteria. Group a method family in one document when the operations belong to one lifecycle such as `create -> query -> update -> delete -> iterate` and can be taught coherently.

Audit all code, commands, diagrams, questions, and answers for prerequisite leakage. A borrowed syntax marker must name the construct, give a minimal reading rule, state that production use is deferred, and avoid testing it in the current lesson.

## Connect Concepts, Syntax, Operations, and Mechanism

For an operational programming topic, follow this chain:

```text
problem or observable phenomenon
  -> formal concept and role
  -> minimal syntax or data shape
  -> call or operation contract
  -> runtime or compile-time mechanism
  -> runnable evidence and output
  -> boundary variation
  -> guided modification
  -> independent use or engineering choice
```

Concept-first teaching does not mean theory without operations. It means that syntax and methods are introduced inside a model that explains their result. Conversely, operation coverage does not mean listing every name without explaining why, when, or how it behaves.

## Cover Methods and APIs as Usable Contracts

Before teaching a language object, library type, command family, SDK surface, or framework feature, build an authoritative surface inventory. Check the relevant categories:

- construction or initialization forms;
- static functions and properties;
- instance properties;
- instance methods;
- operators, protocols, iteration, callbacks, or lifecycle hooks;
- error, absence, empty-state, and cleanup behavior.

Classify each member as:

- **core operation**: required for the unit outcomes and taught with a full contract;
- **supporting operation**: taught when the main example naturally needs it;
- **extension operation**: named with its motivating problem and linked to a later lesson;
- **out of scope**: deliberately omitted with no implication of completeness.

Group operations by the problem or data lifecycle they serve, such as `create -> inspect -> query -> update -> remove -> iterate`. Do not use alphabetical order when it hides relationships.

For every core operation, explain:

1. exact minimal call shape;
2. receiver, command context, or construction target;
3. arguments, accepted input forms, and defaults;
4. return value or observable output;
5. state mutation, identity, allocation, or chaining behavior;
6. absence, empty-state, invalid-input, and error behavior;
7. one natural runnable example with stable labeled output;
8. one high-value boundary or contrast;
9. when to use it and when a nearby alternative is clearer.

### Calibration Example: JavaScript `Map`

A foundational `Map` unit should not stop at “`Map` stores key-value pairs.” Verify the current standard and authoritative documentation, then inventory the course-relevant surface. The baseline usually includes:

```text
create        -> new Map(iterable?)
inspect       -> map.size
write/update  -> map.set(key, value)
query         -> map.get(key), map.has(key)
remove        -> map.delete(key), map.clear()
iterate       -> map.keys(), map.values(), map.entries(), map[Symbol.iterator](), map.forEach(...)
static/extra  -> verify current official surface and classify by course need
```

The lesson must distinguish a property from a method, explain that `set` returns the `Map` and mutates its entries, show why `get` returning `undefined` cannot by itself distinguish a missing key from a stored `undefined`, explain the boolean result of `delete`, and trace the key/value order supplied by iteration and `forEach`. These facts should appear through coherent tasks and examples, not as an unexplained reference table.

Current documentation determines the complete surface. Do not present the baseline above as a timeless exhaustive list.

## Use an Example and Practice Ladder

Choose the smallest useful subset of this ladder for each focused lesson:

1. **minimal shape**: show what the syntax, call, data, or state looks like;
2. **prediction micro-example**: ask for a result before showing it;
3. **execution or state trace**: explain every step that determines the result;
4. **complete worked example**: use the mechanism in one natural task;
5. **boundary variation**: change one condition and predict the new result;
6. **guided modification**: require a small code change with a clear contract;
7. **independent implementation or debugging**: solve a comparable problem without copying the worked example;
8. **unit synthesis**: combine several completed lessons in a small module or project.

Do not require every rung in every short lesson. Foundational and cross-cutting lessons normally need more than a single integrated example. Reuse a coherent scenario when it reduces cognitive switching, but isolate each new mechanism before combining it.

## Write Comments and Outputs for Learning

Use fenced code blocks with the correct language identifier. Keep minimal syntax shapes near the definition and store larger executable examples under `code/` or the repository's experiment directory.

Comments should explain:

- intent: why the setup exists;
- mechanism: which rule the line isolates;
- expectation: what the learner should observe;
- boundary: why a surprising or intentionally invalid line is present.

Do not translate obvious syntax line by line. Use surrounding prose for definitions and execution tracing. Label intentionally invalid code beside the relevant line, and separate non-runnable fragments from verified programs.

For each runnable example, record environment, command, expected output, actual output, and which claims are language guarantees versus runtime or tool observations.

## Define Observable Mastery

Use completion verbs that can be observed:

- **define** the concept and exclude a nearby non-example;
- **predict** a new input, branch, state, output, or error;
- **trace** the execution, data, type, or lifecycle path;
- **modify** a working example without breaking its contract;
- **implement** a comparable task from a short specification;
- **debug** a failure and classify its layer;
- **choose** between alternatives and justify the constraint or cost.

Do not use “read the lesson,” “run the sample,” or “recognize the syntax” as the only completion gate. A unit should normally include at least two practice modes and one synthesis or transfer task.

## Store and Navigate the Course

- Keep the stable course entry under `docs/topics/<course>/00-主题入口.md` or the repository's established equivalent.
- Store unit entries and focused lessons under the course dossier or linked topic dossiers according to existing repository conventions.
- Keep the human-curated current route in `docs/00-index/当前学习路径.md`.
- Keep a durable curriculum coverage matrix when the course is broad enough that prerequisite and operation ownership would otherwise be lost.
- Store runnable evidence under `code/` or `docs/experiments/`; store integrated work under `projects/`.
- Rebuild the generated topic index after adding or renaming topic entries.

## Validate Before Expanding the Course

Before bulk-generating later units, complete one representative sample teaching artifact or unit and verify:

- learning-contract alignment;
- coverage-matrix ownership for every concept and operation;
- no prerequisite leakage in prose, code, exercises, or answers;
- document granularity: neither unrelated mechanisms forced together nor cohesive material atomized into navigation-only files;
- authoritative and current source context;
- complete operation contracts for course-relevant methods and commands;
- runnable code and recorded actual output;
- comments that explain intent, mechanism, expectation, or boundary;
- prediction, modification, implementation, debugging, or choice practice;
- unit synthesis uses only taught material;
- frontmatter, fences, internal links, backlinks, and navigation resolve;
- the learner can state why the next lesson is needed.

If the sample remains a dense overview, uses advanced syntax before teaching it, or validates only that examples execute, revise the curriculum contract before producing more units.
