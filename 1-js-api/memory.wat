(module
  (type $t0 (func (param i32 i32) (result i32)))
  (import "js" "mem" (memory $js.mem 1))
  (func $accumulate (type $t0) (param $p0 i32) (param $p1 i32) (result i32)
    (local $l2 i32) (local $l3 i32)
    local.get $p0
    local.get $p1
    i32.const 4
    i32.mul
    i32.add
    local.set $l2
    block $B0
      loop $L1
        local.get $p0
        local.get $l2
        i32.eq
        br_if $B0
        local.get $l3
        local.get $p0
        i32.load
        i32.add
        local.set $l3
        local.get $p0
        i32.const 4
        i32.add
        local.set $p0
        br $L1
      end
    end
    local.get $l3)
  (export "accumulate" (func $accumulate)))
