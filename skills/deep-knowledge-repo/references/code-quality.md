# Code Example Quality

Use this contract for code stored in `code/` or embedded by experiment notes.

Write comments, docstrings, and reader-facing output in the repository's primary language. In a Simplified Chinese learning repository, use accurate Simplified Chinese explanations; retain programming-language identifiers, keywords, APIs, and protocol terms in their official spelling.

## Standalone Readability

Each runnable file should answer these questions without opening the note:

- What concept is being demonstrated?
- What should the reader observe?
- Which functions isolate the behavior?
- How is the example executed?

Use a module docstring, descriptive function names, a small `main()` function, and `if __name__ == "__main__":` for scripts. Keep imports explicit and avoid clever one-liners that hide the mechanism.

## Comments

Write comments for:

- intent: why this setup exists;
- mechanism: which language rule the line isolates;
- expectation: what output or state change should occur;
- boundary: why an unusual or intentionally broken line is present.

Do not write comments that merely translate `for`, `if`, or assignment syntax into English. Place an intentional error comment immediately beside the error and catch it only when the experiment needs to continue.

## Output Contract

Use stable labels such as `late-bound:` or `unbound-local:`. The companion note should show expected output and explain each line. Do not claim actual output without running the script.

## Language Conventions

Follow the target language's ordinary formatting, naming, imports, type hints, and error-handling style. A teaching example may be minimal, but it must remain valid code. If the example intentionally violates a convention, state the reason and show the production-safe alternative.
