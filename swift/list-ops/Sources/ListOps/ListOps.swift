func append<T>(_ xs: [T], _ ys: [T]) -> [T] {
    return xs + ys
}

func concat<T>(_ xss: [T]...) -> [T] {
    return foldLeft(xss, accumulated: [T](), combine: { append($0, $1) })
}

func filter<T>(_ xs: [T], _ fn: (T) -> Bool) -> [T] {
    return foldLeft(xs, accumulated: [T](), combine: { fn($1) ? append($0, [$1]) : $0 })
}

func length<T>(_ xs: [T]) -> Int {
    return xs.count
}

func map<T, U>(_ xs: [T], _ fn: (T) -> U) -> [U] {
    return foldLeft(xs, accumulated: [U](), combine: { append($0, [fn($1)]) })
}

func foldLeft<T, U>(_ xs: [T], accumulated initial: U, combine fn: (U, T) -> U) -> U {
    var acc = initial
    for x in xs { acc = fn(acc, x) }
    return acc
}

func foldRight<T, U>(_ xs: [T], accumulated initial: U, combine fn: (T, U) -> U) -> U {
    if (xs.count == 0) { return initial }
    var acc = initial
    for idx in 1...xs.count { acc = fn(xs[xs.count - idx], acc) }
    return acc
}

func reverse<T>(_ xs: [T]) -> [T] {
    return foldRight(xs, accumulated: [T](), combine: { append($1, [$0]) })
}