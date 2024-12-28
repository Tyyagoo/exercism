let annotate rows =
  let height = List.length rows in
  let width = if height = 0 then 0 else String.length (List.hd rows) in

  let count_bombs x y =
    let count = ref 0 in
    for dx = -1 to 1 do
      for dy = -1 to 1 do
        let nx, ny = x + dx, y + dy in
        if nx >= 0 && nx < width && ny >= 0 && ny < height then
          if String.get (List.nth rows ny) nx = '*' then
            incr count
      done
    done;
    !count
  in

  let annotate_row y row =
    String.mapi (fun i ch ->
      if ch == '*' then '*' else
      let bombs = count_bombs i y in
      if bombs == 0 then ' ' else Char.chr (bombs + Char.code '0')
   ) row

  in List.mapi annotate_row rows
