# Metadata Schema

Use YAML frontmatter at the top of every note. Keep the core schema stable across subjects.

```yaml
---
title: Topic title
type: concept
subject: Python
status: inbox
level: deep
tags:
  - subject/topic
aliases:
  - English or alternate name
course: "[[Course entry]]"
unit: "[[Unit entry]]"
sequence: 1
prerequisites:
  - "[[Prerequisite]]"
related:
  - "[[Related topic]]"
contrasts:
  - "[[Alternative approach]]"
implemented-in:
  - "[[Experiment or project]]"
source:
  - "https://example.com/primary-source"
---
```

Allowed values are conventions, not a rigid taxonomy:

- `type`: `course`, `unit`, `lesson`, `concept`, `mechanism`, `engineering`, `pattern`, `comparison`, `experiment`, `project`, `reference`, `question`;
- `status`: `inbox`, `learning`, `practiced`, `solid`, `review`, `archived`;
- `level`: `overview`, `working`, `deep`.

Use optional `course`, `unit`, and numeric `sequence` fields for foundational-course navigation. They express containment and order; they do not replace semantic `prerequisites`, `related`, or application links.

Use a subject-specific tag namespace such as `python/asyncio`, `postgresql/mvcc`, `java/jvm`, or `rust/ownership`. Keep tags to classification; put relationships in wikilinks and relationship properties.
