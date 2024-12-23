package pangram

import (
    "strings"
)

func IsPangram(input string) bool {
    set := make(map[rune]struct{})
	for _, char := range (strings.ToLower(input)) {
        if (char >= 'a' && char <= 'z') { set[char] = struct{}{} }
    }
    return len(set) == 26
}
