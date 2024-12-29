(module
  (memory (export "mem") 1)

  ;;
  ;; Encode a string using run-length encoding
  ;;
  ;; @param {i32} inputOffset - The offset of the input string in linear memory
  ;; @param {i32} inputLength - The length of the input string in linear memory
  ;;
  ;; @returns {(i32,i32)} - The offset and length of the encoded string in linear memory
  ;;
  (func (export "encode") (param $i i32) (param $len i32)
    (result i32 i32)
    (local $curr i32) (local $prev i32) (local $count i32) (local $end i32) (local $out i32) (local $outLen i32)
    (local.set $prev (i32.load8_u (local.get $i)))
    (local.set $count (i32.const 1))
    (local.set $end (i32.add (local.get $i) (local.get $len)))
    (local.set $out (i32.const 1024))
    (local.set $outLen (i32.const 0))
    (loop $each
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (local.set $curr (i32.load8_u (local.get $i)))
      (if (i32.eqz (i32.sub (local.get $curr) (local.get $prev)))
        (then (local.set $count (i32.add (local.get $count) (i32.const 1))))
        (else (block (if (i32.gt_u (local.get $count) (i32.const 9))
            (then (block ;; handle N > 99
              (i32.store8 (i32.add (local.get $out) (local.get $outLen)) (i32.add (i32.div_u (local.get $count) (i32.const 10)) (i32.const 48)))
              (local.set $outLen (i32.add (local.get $outLen) (i32.const 1)))
              (i32.store8 (i32.add (local.get $out) (local.get $outLen)) (i32.add (i32.rem_u (local.get $count) (i32.const 10)) (i32.const 48)))
              (local.set $outLen (i32.add (local.get $outLen) (i32.const 1)))))
            (else (block (if (i32.gt_u (local.get $count) (i32.const 1)) (then (block
                  (i32.store8 (i32.add (local.get $out) (local.get $outLen)) (i32.add (local.get $count) (i32.const 48)))
                  (local.set $outLen (i32.add (local.get $outLen) (i32.const 1)))))))))
          (i32.store8 (i32.add (local.get $out) (local.get $outLen)) (local.get $prev))
          (local.set $outLen (i32.add (local.get $outLen) (i32.const 1)))
          (local.set $prev (local.get $curr))
          (local.set $count (i32.const 1)))))
      (br_if $each (i32.gt_s (i32.sub (local.get $end) (local.get $i)) (i32.const 0))))
    (return (local.get $out) (local.get $outLen)))

  ;;
  ;; Decode a string using run-length encoding
  ;;
  ;; @param {i32} inputOffset - The offset of the string in linear memory
  ;; @param {i32} inputLength - The length of the string in linear memory
  ;;
  ;; returns {(i32,i32)} - The offset and length of the decoded string in linear memory
  ;;
  (func (export "decode") (param $i i32) (param $len i32)
    (result i32 i32)
    (local $char i32) (local $acc i32) (local $end i32) (local $out i32) (local $outLen i32)
    (local.set $acc (i32.const 0))
    (local.set $end (i32.add (local.get $i) (local.get $len)))
    (local.set $out (i32.const 2048))
    (local.set $outLen (i32.const 0))
    (loop $each (if (i32.gt_s (i32.sub (local.get $end) (local.get $i)) (i32.const 0)) (block
        (local.set $char (i32.load8_u (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (if (i32.and (i32.gt_u (local.get $char) (i32.const 47)) (i32.lt_u (local.get $char) (i32.const 58)))
          (then (local.set $acc (i32.add (i32.mul (local.get $acc) (i32.const 10)) (i32.sub (local.get $char) (i32.const 48)))))
          (else (loop $times
            (i32.store8 (i32.add (local.get $out) (local.get $outLen)) (local.get $char))
            (local.set $outLen (i32.add (local.get $outLen) (i32.const 1)))
            (local.set $acc (i32.sub (local.get $acc) (i32.const 1)))
            (br_if $times (i32.gt_s (local.get $acc) (i32.const 0)))
            (local.set $acc (i32.const 0))
          )))
        (br $each))))
    (return (local.get $out) (local.get $outLen)))
)
