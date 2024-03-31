fun reduce (f: ('b * 'a) -> 'b, acc: 'b, []: 'a list) = acc
  | reduce (f, acc, (x :: xs)) = reduce (f, (f (acc, x)), xs)

fun concat (lists: int list list): int list =
  foldr op@ [] lists

fun reverse (list: int list): int list =
  reduce (fn (xs, x) => x :: xs, [], list)

fun filter (f: int -> bool, list: int list): int list =
  reverse (reduce (fn (xs, x) => if f(x) then x :: xs else xs, [], list))

fun map (f: int -> int, list: int list): int list =
  reverse (reduce (fn (xs, x) => f x :: xs, [], list))

fun append (list1: int list, list2: int list): int list =
  list1 @ list2

fun length (list: int list): int =
  reduce (fn (xs, x) => xs + 1, 0, list)

fun foldl (f: int * int -> int, initial: int, list: int list): int =
  reduce (f, initial, list)

fun foldr (f: int * int -> int, initial: int, []: int list): int = initial
  | foldr (f, initial, (x :: xs)) = f (x, foldr(f, initial, xs))

