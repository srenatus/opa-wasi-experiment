(module
    (import "env" "memory" (memory 100))
    (export "memory" (memory 0))

    (func (export "opa_builtin0") (param i32 i32) (result i32) unreachable )
    (func (export "opa_builtin1") (param i32 i32 i32) (result i32) unreachable )
    (func (export "opa_builtin2") (param i32 i32 i32 i32) (result i32) unreachable )
    (func (export "opa_builtin3") (param i32 i32 i32 i32 i32) (result i32) unreachable )
    (func (export "opa_builtin4") (param i32 i32 i32 i32 i32 i32) (result i32) unreachable )
    (func (export "opa_abort") (param i32) unreachable )
)
