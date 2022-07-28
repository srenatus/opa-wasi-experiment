(module
    ;;(memory 100)
    (import "env" "memory" (memory 100))
    (export "memory" (memory 0))

    ;; TODO unreachable instead
    (func (export "opa_builtin0") (param i32 i32) (result i32) i32.const 0 )
    (func (export "opa_builtin1") (param i32 i32 i32) (result i32) i32.const 0 )
    (func (export "opa_builtin2") (param i32 i32 i32 i32) (result i32) i32.const 0 )
    (func (export "opa_builtin3") (param i32 i32 i32 i32 i32) (result i32) i32.const 0 )
    (func (export "opa_builtin4") (param i32 i32 i32 i32 i32 i32) (result i32) i32.const 0 )
    (func (export "opa_abort") (param i32) unreachable )
    
    ;;(func $main (export "_start") )
)
