module ProteinTranslation
  CODON_TO_PROTEIN = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine",
    "UCU" => "Serine", "UCC" => "Serine", "UCA" => "Serine", "UCG" => "Serine",
    "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP"
  }

  def self.translate(codon : String) : String
    CODON_TO_PROTEIN.fetch(codon) {
      raise ArgumentError.new("Invalid codon: #{codon}")
    }
  end

  def self.proteins(strand : String) : Array(String)
    strand.chars.each_slice(3)
          .map { |slice| translate(slice.join) }
          .take_while { |protein| protein != "STOP" }
          .to_a
  end
end
