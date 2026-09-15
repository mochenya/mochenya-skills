---
name: api-contract-writing
description: 编写或审查用于前后端对接的 API 接口文档，明确请求与响应、字段语义、业务规则、权限和错误约定。用于把接口行为整理成前后端共同遵守的对接契约；不用于实现后端接口或前端代码。
---

# API Contract Writing

## Purpose

Produce an `API Contract（接口契约：调用方与服务端共同遵守的请求、响应、语义和边界约定）` that a consumer can use without reading server source code, guessing field meanings, or depending on a frontend framework.

The output is a contract document, not a backend code tour and not a React, Vue, Axios, or TypeScript tutorial.

## Scope boundary

This skill defines how the document should be written and judged. It does not prescribe how to discover implementation facts, call a live environment, generate OpenAPI, write contract tests, change server code, publish docs, or build a frontend SDK. Perform those activities only when the user separately requests them.

When the supplied material does not establish a fact, do not fill the gap with a plausible assumption. Mark it as `待确认` or `未定义`, explain the impact, and keep the claim out of the normative contract.

## Required output

Write the smallest document that is complete for its intended consumer. Unless the user requests another format, organize it as:

1. interface summary and scope;
2. method, path, base URL context, authentication, and permission;
3. request parameters or body schema;
4. success response schema;
5. field dictionary with business meaning and nullability;
6. business rules and invariants;
7. empty-data and boundary behavior;
8. error responses;
9. protocol-level request and response examples;
10. contract status, evidence, unresolved decisions, and change notes when relevant.

Read [writing-standard.md](references/writing-standard.md) for the detailed writing rules and [quality-checklist.md](references/quality-checklist.md) before declaring the document complete. Use [api-contract-template.md](assets/api-contract-template.md) as a deletable starting structure when a document template is useful.

## Non-negotiable writing rules

- Define the business meaning of every externally visible field; a language type alone is insufficient.
- State `required`, `nullable`, default, format, unit, range, enum, matching rule, ordering, and relationships whenever they affect consumption.
- Distinguish missing fields, `null`, zero values, empty strings, and empty arrays.
- Explain formulas, denominators, units, time zones, precision, deduplication, and window semantics for metrics or aggregates.
- Separate authentication failure from resource authorization failure, and distinguish a missing resource from an existing resource with no data.
- Make examples structurally valid, semantically consistent, clearly illustrative, and free of credentials or real personal data.
- Treat protocol shape, field semantics, business rules, implementation observations, and open decisions as different kinds of information. Label observations or unknowns instead of presenting them as guaranteed behavior.
- Keep server-internal tables, classes, SQL, framework details, and frontend implementation out of the consumer-facing body unless they are necessary to disambiguate an external contract.
- Prefer stable machine-oriented values such as HTTP status and numeric codes for branching; describe human-readable messages as display or diagnostic text unless the contract explicitly makes them stable.

## Evidence and status

When the document relies on imperfect or mixed source material, use concise status labels:

- `已确认` — an approved contract or explicit domain decision establishes the rule;
- `当前实现` — the behavior is visible in the supplied implementation but is not necessarily an intentional long-term promise;
- `已验证` — an executable test or observed request confirms the behavior in a named environment;
- `待确认` — the available material cannot establish the rule.

Do not silently resolve conflicts between an existing document, schema, implementation, and observed behavior. State the conflict and its consumer impact.

## Completion standard

Before finishing, confirm that a consumer can answer all of these from the document:

- Which method and URL should be used?
- Which credentials or headers are required?
- What does every identifier mean, and which identifier must be sent?
- Which inputs are required, nullable, bounded, or defaulted?
- What is the complete success shape?
- What do empty, null, zero, and absent values mean?
- How are metrics, sorting, pagination, and windows defined?
- What does each relevant error status mean?
- Which statements are guaranteed, merely current implementation behavior, verified observations, or unresolved decisions?

If an answer still requires reading server source or guessing, the document is not complete. Do not claim completion merely because the endpoint and JSON example are present.
