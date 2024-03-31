fun concat ([]: int list list): int list = []
  | concat (x :: xs) = x @ concat xs

fun reverse ([]: int list): int list = []
  | reverse (x :: xs) = reverse xs @ [x]

fun filter (f: int -> bool, []: int list): int list = []
  | filter (f, (x :: xs)) = if f(x) then x :: filter (f, xs) else filter(f, xs)

fun map (f: int -> int, []: int list): int list = []
  | map (f, (x :: xs)) = f x :: map (f, xs)

fun append (list1: int list, list2: int list): int list =
  list1 @ list2

fun length (nil: int list): int = 0
  | length (_ :: xs) = 1 + (length xs)

fun foldl (f: int * int -> int, initial: int, []: int list): int = initial
  | foldl (f, initial, (x :: xs)) = foldl (f, f (initial, x), xs)

fun foldr (f: int * int -> int, initial: int, []: int list): int = initial
  | foldr (f, initial, (x :: xs)) = f (x, foldr(f, initial, xs))

