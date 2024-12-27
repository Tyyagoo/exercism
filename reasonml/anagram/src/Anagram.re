let anagrams = (word, candidates) => {
  let sortWord = (word: string) => {
    word
    |> String.lowercase
    |> Js.String.split("")
    |> Js.Array.sortInPlace
    |> Js.Array.joinWith("")
  }
  
  let sortedWord = sortWord(word)
    
  List.filter(w => sortedWord == sortWord(w)
              && String.lowercase(word) != String.lowercase(w), candidates)
};
