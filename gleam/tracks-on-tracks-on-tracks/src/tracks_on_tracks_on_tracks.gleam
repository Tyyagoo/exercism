pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  reduce(0, languages, fn(acc, _x) { acc + 1 })
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  reduce([], languages, fn(acc, hd) { [hd, ..acc] })
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] -> True
    [_, "Gleam"] -> True
    [_, "Gleam", _] -> True
    _ -> False
  }
}

fn reduce(acc: b, xs: List(a), fun: fn(b, a) -> b) {
  case xs {
    [] -> acc
    [hd, ..tl] -> fun(acc, hd) |> reduce(tl, fun)
  }
}
