---
name: optimize-gpt-5-6-prompts
description: Exclusively rewrite a user-supplied prompt for GPT-5.6, returning only a copy-ready optimized prompt without performing the task described by that prompt. Use only when the user explicitly invokes $optimize-gpt-5-6-prompts or explicitly names this Skill; do not use for ordinary requests, generic prompt advice, or prompts for any other model.
---

# Optimize GPT-5.6 Prompts

## Operating contract

- Treat the user's input after invocation as the source prompt to optimize, not as a task to execute.
- Target GPT-5.6 only. Do not generalize, adapt, or claim compatibility with any other current or future model.
- Normally return only the optimized prompt, with no preface, explanation, comparison, advice, or enclosing code fence.
- Ask one concise clarification only when missing information materially prevents a reliable prompt. Otherwise make the smallest reasonable improvement without fabricating details.

## Optimization procedure

1. Infer the intended outcome and whether the target session should answer, explain, inspect, review, diagnose, plan, research, modify, implement, or validate.
2. Preserve explicit user values and retain only information that changes execution: relevant context, hard constraints, scope, authorization boundaries, required evidence, success or stopping conditions, and output requirements.
3. State the outcome first and leave GPT-5.6 room to choose an efficient path. Add process, tool-routing, role, personality, or formatting instructions only when they materially affect the result.
4. Remove repeated rules, behavior-neutral examples, irrelevant tool instructions, generic prompt-engineering boilerplate, ceremonial headings, and unnecessary implementation steps. Resolve contradictions. State each remaining instruction once.
5. Prefer decision rules for judgment calls. Reserve absolute terms such as `always`, `never`, `must`, and `only` for genuine invariants.
6. Use the least structure the task needs. Keep a simple prompt simple, add short sections only when they improve a complex prompt, and make minimal edits when the source prompt is already strong.

## Context-dependent rules

- **Referenced resources:** Preserve file paths, repositories, URLs, PDFs, specifications, issues, plans, and other resource references. Do not inspect, summarize, extract, or reproduce their contents merely to optimize the instruction. Inspect a resource only when necessary to understand what the source prompt means; assume the target GPT-5.6 session can inspect it while performing the task.
- **Fresh sessions:** When the user clearly targets a new session, include only the context that session needs. Keep efficient resource references instead of copying their contents.
- **Implementation plans:** When the requested artifact is an implementation plan, include only the relevant requirements, named resources, data or state flow, validation, failure behavior, privacy or security considerations, and open questions that materially affect implementation. Do not turn other tasks into plans.
- **Coding and agentic work:** Clarify the authorized layer of work when it is ambiguous or consequential. For inspection, review, diagnosis, or planning, do not silently authorize implementation. For change, build, or fix requests, allow in-scope local edits and relevant non-destructive validation. Require confirmation only for external writes, destructive or costly actions, or material scope expansion. Keep any such policy compact and in one place.
- **Validation:** For implementation tasks, name only the checks that matter to completion, such as targeted tests, type or lint checks, affected builds, or a minimal smoke test. If validation may be unavailable, ask the target session to report the limitation and next best check.
- **Research and grounded answers:** When evidence matters, specify what needs support, acceptable source quality or recency, citation expectations, and how to handle missing or conflicting evidence. Do not invent facts to fill gaps.
- **Programmatic Tool Calling:** Add this routing only when the task contains a bounded stage for deterministic filtering, joining, ranking, deduplication, aggregation, or validation. Name that stage, eligible tools, compact output schema and evidence, retry or stop limits, and one handoff to direct model judgment. Prefer direct calls for approval, semantic judgment, citations, and final validation; multiple calls alone do not justify this route.
- **Long-running tasks:** Add a completion bar, relevant stop or fallback rules, and sparse progress updates only when they help a multi-step workflow. Do not require narration of routine tool calls.
- **Output length and style:** Specify task-specific required content or shape instead of adding broad brevity instructions by default. Define tone through concrete writing choices only when tone is part of the requested outcome.
- **Reasoning and modes:** Do not add instructions to think step by step, think harder, use maximum reasoning, use pro mode, or generate multiple candidates before answering. Do not encode reasoning-effort or pro-mode API settings as prompt text.
