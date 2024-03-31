type Accumulator(a) {
  Halt(a)
  Run(a)
}

fn reduce(acc: b, xs: List(a), fun: fn(b, a) -> b) {
  case xs {
    [] -> acc
    [hd, ..tl] -> fun(acc, hd) |> reduce(tl, fun)
  }
}

fn reduce_while(acc: Accumulator(b), xs: List(a), fun: fn(b, a) -> Accumulator(b)) {
  case acc, xs {
    Halt(result), _ -> result
    Run(result) , [] -> result
    Run(acc), [hd, ..tl] -> fun(acc, hd) |> reduce_while(tl, fun)
  }
}

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [hd, ..] -> hd
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [hd, ..tl] -> [hd + 1, ..tl]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  reduce_while(Run(False), days, fn(acc, today) {
    case today {
      0 -> Halt(True)
      _ -> Run(acc)
    }
  })
}

pub fn total(days: List(Int)) -> Int {
  reduce(0, days, fn(acc, today) { acc + today })
}

pub fn busy_days(days: List(Int)) -> Int {
  reduce(0, days, fn(acc, today) {
    case today {
      x if x >= 5 -> acc + 1
      _ -> acc
    }
  })
}

