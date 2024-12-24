module Bob

open System.Text.RegularExpressions

let response (input: string): string =
    let input = input.Trim()
    let silence = input |> System.String.IsNullOrEmpty
    let yelling = input.ToUpper() = input && Regex(@"[A-Z]").IsMatch(input)
    let asking = Regex(@"\?$").IsMatch(input)
    match (silence, yelling, asking) with
    | (true, _, _) -> "Fine. Be that way!"
    | (_, true, true) -> "Calm down, I know what I'm doing!"
    | (_, _, true) -> "Sure."
    | (_, true, _) -> "Whoa, chill out!"
    | _ -> "Whatever."

    