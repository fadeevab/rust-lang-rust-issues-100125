# The Minimal Complete and Verifiable Example for the Rust [Issue #100125](https://github.com/rust-lang/rust/issues/100125)

Based on [Cocoon](https://github.com/fadeevab/cocoon) project.

## Prerequisites

```bash
cargo install cargo-bisect-rustc
```

## How To Rust

```bash
./reproduce.sh
```

1 unit-test may fail, but it doesn't impact reproducibility, because it checks the code coverage.
