"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    letters = Set(replace(lowercase(input), r"[^a-z]" => ""))
    return length(letters) == 26
end

