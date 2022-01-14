#!/bin/bash -xe

rm -rf modules
mkdir modules

pushd modules
cargo new a --bin
cargo new b --lib
cargo new c --lib
cargo new e --lib
popd

pushd modules/b
echo 'c = { path = "../c" }' >> Cargo.toml
popd

pushd modules/c
echo 'keycloak = "13.0.102"' >> Cargo.toml
popd

pushd modules/e
echo 'keycloak = "13.0.100"' >> Cargo.toml
popd

pushd modules/a
echo 'b = { path = "../b" }' >> Cargo.toml
echo 'e = { path = "../e" }' >> Cargo.toml
echo 'keycloak = "12.0.1"' >> Cargo.toml
cargo run
popd

