let rec search array value = function
  | left, right when left > right -> Error "value not in array"
  | left, right ->
    let mid = (left + right) / 2 in
    match array.(mid) with
    | v when v = value -> Ok mid
    | v when v < value -> search array value (mid + 1, right)
    | _ -> search array value (left, mid - 1)

let find array value =
    search array value (0, Array.length array - 1)