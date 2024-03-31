pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(over: first, from: second, with: fn(tl, hd) { [hd, ..tl] })
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(over: lists, from: [], with: fn(acc, list) {
    case list {
      [] -> acc
      _ -> append(first: acc, second: list)
    }
  })
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  foldl(over: list, from: [], with: fn(tl, hd) {
    case function(hd) {
      True -> [hd, ..tl]
      False -> tl
    }
  })
  |> reverse()
}

pub fn length(list: List(a)) -> Int {
  foldl(over: list, from: 0, with: fn(count, _) { count + 1 })
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  foldl(over: list, from: [], with: fn(tl, hd) { [function(hd), ..tl] })
  |> reverse()
}

pub fn foldl(
  over list: List(a),
  from acc: b,
  with fun: fn(b, a) -> b,
) -> b {
  case list {
    [] -> acc
    [hd, ..tl] -> foldl(tl, fun(acc, hd), fun)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  foldl(over: reverse(list), from: initial, with: function)
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(over: list, from: [], with: fn(tl, hd) { [hd, ..tl] })
}

