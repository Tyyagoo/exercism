package foodchain

import (
	"fmt"
)

var food = [8]string{"fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"}
var rhyme = [8]string{
	"I don't know why she swallowed the fly. Perhaps she'll die.",
	"It wriggled and jiggled and tickled inside her.",
	"How absurd to swallow a bird!",
	"Imagine that, to swallow a cat!",
	"What a hog, to swallow a dog!",
	"Just opened her throat and swallowed a goat!",
	"I don't know how she swallowed a cow!",
	"She's dead, of course!",
}

func Verse(v int) string {
	lyrics := fmt.Sprintf("I know an old lady who swallowed a %s.\n%s", food[v-1], rhyme[v-1])

	if v == 8 {
		return lyrics
	}

	for i := v; i > 1; i-- {
		bonus := ""
		if food[i-2] == "spider" {
			bonus = " that wriggled and jiggled and tickled inside her"
		}

		lyrics += fmt.Sprintf("\nShe swallowed the %s to catch the %s%s.", food[i-1], food[i-2], bonus)
	}

	if v != 1 {
		lyrics += "\n" + rhyme[0]
	}

	return lyrics
}

func Verses(start, end int) string {
	lyrics := Verse(start)
	for i := start + 1; i <= end; i++ {
		lyrics += "\n\n" + Verse(i)
	}
	return lyrics
}

func Song() string {
	return Verses(1, 8)
}
