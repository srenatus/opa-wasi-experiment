# OPA Wasm and WASI experiment

## What?

This is the scratchpad for rewrapping OPA's wasm modules into a format that can
be run with a plain WASI host.

## How?

Requirements:

- `wabt` from https://github.com/WebAssembly/wabt/ (or brew, or whatever)
- `export-audit` and `wasmlink` from https://github.com/fixpointOS/wasm-tools/
- [zig](https://ziglang.org/)

`run.sh` contains a set of steps that lead to a successful call of `wasmtime output.wasm`.

The policy.wasm has to be supplied out of band, there's no example here (yet).

The one I had used was

```rego
package play

allow := { "one": 1 }
```

- compiled to wasm via `opa build -t wasm x.rego -e play/allow`
- extracted via `tar zxvf bundle.tar.gz /policy.wasm`
`
