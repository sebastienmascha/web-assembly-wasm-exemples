(module
  (type $t0 (func (result i32)))
  (func $f0 (type $t0) (result i32)
    i32.const 13)
  (func $f1 (type $t0) (result i32)
    i32.const 42)
  (table $tbl 2 2 funcref)
  (export "tbl" (table 0))
  (elem $e0 (i32.const 0) $f0 $f1))
