(module
  (type $t0 (func (result i32)))
  (type $t1 (func))
  (import "js" "global" (global $js.global (mut i32)))
  (func $getGlobal (type $t0) (result i32)
    global.get $js.global)
  (func $incGlobal (type $t1)
    global.get $js.global
    i32.const 1
    i32.add
    global.set $js.global)
  (export "getGlobal" (func $getGlobal))
  (export "incGlobal" (func $incGlobal)))
