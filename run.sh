#!/bin/bash

set -ex

# remove the memory export and the globals exports from policy.wasm
# - memory will be imported from stub_imports.wat, and can't be exported twice
# - the globals exports confuse wasmtime
export-audit -r opa_wasm_abi_version -r opa_wasm_abi_minor_version -r memory ../policy.wasm p.wasm
# now we have the same module, but with three exports less

# we get rid of the imports by stubbing them out
# the non-wasi imports also confuse wasmtime
wat2wasm stub_imports.wat
wasmlink -v -m env -n policy stub_imports.wasm p.wasm -o q.wasm
# now we've got a module without imports; it also cannot use any none of the
# builtins that aren't natively implemented in wasm

# we remove the memory export again: this was the export from stub_imports.wat
export-audit -r memory q.wasm r.wasm

# build the zig shell module
zig build-exe main.zig -target wasm32-wasi
wasmlink -v -m env -n policy main.wasm r.wasm -o o.wasm
# we now have a wasi-compatible module that executes opa_eval with some fake
# inputs in its main method

# execute it!
wasmtime o.wasm

