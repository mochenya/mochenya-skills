# API Contract Writing Standard

## 1. Audience and contract goal

Write for a consumer who needs to integrate with the HTTP API, not for a developer who needs to understand the server's internal architecture. The document must answer what the consumer may send, what the server guarantees in return, and how to interpret boundary outcomes.

Keep three layers separate:

1. **Protocol shape** — method, URL, headers, parameters, media types, status codes, and JSON structure.
2. **Domain semantics** — what each field and resource means in the product or business domain.
3. **Behavioral rules** — authorization, matching, calculation, ordering, defaults, absence, and failure conditions.

Do not use a protocol type as a substitute for domain semantics. `string`, `integer`, and `boolean` describe representation; they do not explain identity, unit, lifecycle, or meaning.

## 2. Standard document order

Use this order unless the API shape makes a section irrelevant:

### Interface summary

State the business operation in one sentence. Include the resource, scope, and result. Avoid vague verbs such as “处理数据” or “获取信息” without naming the actual result.

### Request contract

State:

- HTTP method and path;
- base URL or environment placeholder when relevant;
- authentication header and token scheme;
- resource-level permission;
- content type and accepted media types;
- query, path, header, cookie, and body parameters;
- idempotency or side effects for mutating operations.

For every input, document:

| Property | Required description |
|---|---|
| Name and location | Exact wire name and whether it is query/path/header/body |
| Representation type | Wire type, format, and encoding |
| Requiredness | Required, optional, conditionally required, or prohibited |
| Nullability | Whether explicit `null` is accepted or meaningful |
| Default | Server-applied default, if any |
| Validation | Range, length, pattern, enum, precision, or cross-field rule |
| Business meaning | What domain object or concept it identifies or describes |
| Relationship | Dependency on another parameter or request state |

If the wire representation and semantic type differ, state both. For example, a query value is transported as text but must contain an integer from 1 to 100.

### Response contract

Show the complete success envelope and nested schema. Do not omit wrapper fields such as `code`, `message`, `data`, or `total` merely because the data object is the main interest.

For every output field, state:

- type and format;
- always present or conditionally present;
- nullable or non-null;
- unit and scale;
- source concept if it prevents identifier confusion;
- ordering or uniqueness guarantee;
- relationship to sibling fields;
- meaning when the collection is empty.

### Business rules and invariants

Write rules so a consumer can evaluate them. Prefer:

```text
mastery_rate = correct_question_count / total_question_count
```

over:

```text
mastery_rate 表示学生掌握情况。
```

For aggregates, define numerator, denominator, filters, deduplication, threshold, time window, rounding, and the zero-denominator result. For lists, define ordering, windowing, cursor/page semantics, and whether repeated domain records are deduplicated.

### Empty and boundary behavior

Explicitly distinguish:

- missing input;
- invalid input;
- unauthenticated caller;
- authenticated but unauthorized caller;
- missing resource;
- existing resource with no matching data;
- empty collection;
- `null` metric caused by an undefined denominator;
- zero metric caused by a defined denominator and zero numerator.

### Errors

For each relevant status, state the trigger and the stable fields a consumer may use. Do not make the consumer branch on a localized or mutable message unless the contract explicitly guarantees that message.

At minimum consider 400, 401, 403, 404, 409, 413/415 for upload contracts, 422 where the system uses it, and 500/503 where they are part of the exposed behavior. Do not list statuses that the contract cannot support merely to make the table look complete.

### Examples

Include protocol-level examples, not framework code. Examples must:

- validate against the described schema;
- obey stated field relationships and formulas;
- show at least one meaningful boundary when the boundary changes interpretation;
- use fictional or clearly masked identifiers;
- never contain passwords, tokens, connection strings, or real personal data.

### Contract status and open decisions

When the source material is not an approved normative contract, add a short status section. Use these labels:

- `已确认`: an explicit product/domain/API decision establishes the rule;
- `当前实现`: the supplied code currently behaves this way, but long-term compatibility is not established;
- `已验证`: a named test or environment observed this behavior;
- `待确认`: the available evidence is insufficient.

List contradictions separately. Do not merge “current implementation” into “guaranteed behavior” without an explicit decision.

## 3. Language and presentation

- Use stable, direct Chinese. Keep official identifiers, HTTP methods, status names, and API field names unchanged.
- Introduce a domain term before using it as if it were obvious.
- Use tables for field mappings, status mappings, and compact comparisons; use prose for formulas, lifecycle, and semantic boundaries.
- Put the conclusion or contract rule before implementation rationale.
- Keep examples close to the rule they demonstrate.
- Do not bury requiredness, nullability, or default values in a paragraph.
- Use “必须”“可以”“不会保证”“当前实现”“待确认” deliberately; avoid vague words such as “一般”“通常”“可能会” when a contract decision is needed.

## 4. What does not belong in the consumer-facing document

Do not include server class names, ORM tables, SQL joins, internal module paths, deployment shell commands, frontend framework code, or debugging transcripts unless a concise traceability note is explicitly useful and clearly separated from the contract.

Do not expose secrets or live personal data. Do not invent enum members, pagination guarantees, retry safety, consistency guarantees, or compatibility promises that the supplied facts do not establish.
