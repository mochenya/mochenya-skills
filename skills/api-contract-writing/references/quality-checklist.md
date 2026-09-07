# API Contract Quality Checklist

Use this checklist to review the document, not as a requirement to add decorative sections. A section may be omitted only when it is genuinely irrelevant to the endpoint.

## Contract completeness

- [ ] The business operation and resource scope are stated precisely.
- [ ] Method, path, base URL context, media type, and authentication scheme are unambiguous.
- [ ] Resource-level permission is separate from login authentication.
- [ ] Every input location is explicit: query, path, header, cookie, or body.
- [ ] Every input has type, requiredness, nullability, default, and relevant validation rules.
- [ ] Every identifier's domain meaning is explicit; database IDs and business IDs are not conflated.
- [ ] The complete success envelope and nested response shape are shown.
- [ ] Every output field has semantics, not only a programming-language type.
- [ ] Units, ranges, precision, time format, timezone, and enum meanings are stated when relevant.
- [ ] Collection ordering, uniqueness, pagination, and window rules are stated when relevant.
- [ ] Aggregates state the numerator, denominator, filters, threshold, rounding, and zero-denominator behavior.
- [ ] Empty collections, `null`, zero, absent fields, and missing resources are distinguished.
- [ ] Relevant error statuses have triggers and stable machine-readable handling guidance.
- [ ] Examples are complete, schema-consistent, semantically consistent, fictional or masked, and secret-free.

## Evidence and honesty

- [ ] Normative guarantees are distinguishable from current implementation observations.
- [ ] Runtime observations name their environment or test context when that affects interpretation.
- [ ] Unknown or undecided rules are marked `待确认` rather than guessed.
- [ ] Conflicts between code, schema, existing docs, and observed behavior are visible.
- [ ] The document does not claim stronger compatibility, ordering, consistency, retry, or permission guarantees than the evidence supports.

## Consumer usability

- [ ] A consumer can construct a valid request without reading server source.
- [ ] A consumer can identify which values to send for every identifier.
- [ ] A consumer can parse success, no-data, and error outcomes without matching human-readable message text.
- [ ] The document is framework-neutral and contains no unnecessary frontend implementation tutorial.
- [ ] Domain terminology is consistent across request fields, response fields, examples, and prose.
- [ ] The main contract appears before internal rationale or traceability details.

## Failure criteria

The document is not ready if any of these is true:

- a required field is merely described as “important” without requiredness;
- an ID field could reasonably be confused with another ID and the distinction is not documented;
- a ratio, score, amount, date, or count has no unit or scale where one matters;
- an empty result and a missing resource are indistinguishable;
- a response example contains fields not described by the schema or violates a stated invariant;
- the document silently resolves a source conflict;
- the only evidence for a strong guarantee is a single incidental runtime response;
- the reader must infer behavior from backend class names, table names, or framework code.
