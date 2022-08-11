# The Minimal Complete and Verifiable Example for the Rust [Issue #100125](https://github.com/rust-lang/rust/issues/100125)

Based on [Cocoon](https://github.com/fadeevab/cocoon) project.

## Prerequisites

```bash
cargo install cargo-bisect-rustc
```

## How To Run

```bash
./reproduce.sh
```

**Explanation**: if grep finds 80-90% in a coverage report (it looks for a 99% or say 84%, which is also good), so it's just looking for '>9' or '>8', then the script returns 0, else it returns error 1.

1 unit-test may fail, but it doesn't impact reproducibility, because it checks the code coverage.
