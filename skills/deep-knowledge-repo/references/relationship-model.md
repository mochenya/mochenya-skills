# Relationship Model

Prefer explicit semantic links over a large number of tags.

| Relation | Meaning | Example |
| --- | --- | --- |
| `prerequisites` | Needed before understanding the topic | `[[协程]]` -> `[[事件循环]]` |
| `related` | Shares a mechanism or context | `[[Task]]` <-> `[[Future]]` |
| `contrasts` | Similar concept with an important difference | `[[线程]]` vs `[[协程]]` |
| `implemented-in` | Verified by executable evidence | `[[事件循环]]` -> `[[event_loop_demo.py]]` |
| `used-in` | Applied by a project or architecture | `[[Repository Pattern]]` -> `[[File Service]]` |
| `builds-on` | Direct conceptual extension | `[[装饰器]]` -> `[[闭包]]` |

Use frontmatter for stable high-level relations and body sections for explanations and examples. Do not invent relation names for every sentence; add a new relation only when it supports navigation or review.

An orphan is acceptable in `99-inbox/` or for a newly created foundational note. Before marking a topic `solid`, connect it to upstream knowledge and at least one experiment, application, or deliberate explanation of why no application is relevant.
