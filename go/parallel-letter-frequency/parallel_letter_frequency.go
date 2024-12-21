package letter

import (
    "sync"
)

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}
	for _, r := range text {
        frequencies[r]++
    }
	return frequencies
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
    var wg sync.WaitGroup
    ch := make(chan FreqMap, len(texts))
    
	for _, txt := range texts {
        wg.Add(1)
        go func(text string) {
            ch <- Frequency(text)
            wg.Done()
        }(txt)
    }

    go func() {
        wg.Wait()
        close(ch)
    }()

    frequencies := FreqMap{}
    for freq := range ch {
        for k, v := range freq {
            frequencies[k] += v
        }
    }

    return frequencies
}
