class FoodChain
  FOOD = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
  RHYME = [
    "",
    "\nIt wriggled and jiggled and tickled inside her.",
    "\nHow absurd to swallow a bird!",
    "\nImagine that, to swallow a cat!",
    "\nWhat a hog, to swallow a dog!",
    "\nJust opened her throat and swallowed a goat!",
    "\nI don't know how she swallowed a cow!",
    "\nShe's dead, of course!\n"
  ]

  def self.verse(n)
    lyrics = "I know an old lady who swallowed a #{FOOD[n]}.#{RHYME[n]}"
    return lyrics if n == 7

    (n).downto(1) do |i|
      bonus = FOOD[i - 1] == "spider" ? " that wriggled and jiggled and tickled inside her" : ""
      lyrics += "\nShe swallowed the #{FOOD[i]} to catch the #{FOOD[i - 1]}#{bonus}."
    end

    lyrics + "\nI don't know why she swallowed the fly. Perhaps she'll die.\n"
  end
  
  def self.song
    (0..7).map { |i| verse(i) }.join("\n")
  end
end