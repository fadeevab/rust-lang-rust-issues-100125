#!/bin/sh

export CARGO_INCREMENTAL=0
export RUSTDOCFLAGS="-Zprofile -Ccodegen-units=1 -Copt-level=0 -Clink-dead-code -Coverflow-checks=off -Zpanic_abort_tests -Cpanic=abort"
export RUSTFLAGS="-Zprofile -Ccodegen-units=1 -Copt-level=0 -Clink-dead-code -Coverflow-checks=off -Zpanic_abort_tests -Cpanic=abort"

cargo test --all-features
mkdir -p ./${CARGO_TARGET_DIR}/coverage
if [ ! -f ./grcov ]; then curl -L https://github.com/mozilla/grcov/releases/latest/download/grcov-x86_64-unknown-linux-gnu.tar.bz2 | tar jxf -; chmod +x grcov; fi
./grcov ./${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/debug/ -s . -t html --llvm --branch --ignore-not-existing --ignore "/*"  --excl-line '#\[|=> panic!|unreachable!|Io\(std::io::Error\)'  --excl-br-line '#\[|=> panic!|unreachable!|assert_..!' -o ./${CARGO_TARGET_DIR}/coverage/lcov.html
grep -e ">[89]" ./${CARGO_TARGET_DIR}/coverage/lcov.html/index.html
