class Bob
  def self.hey(talk)
    talk = talk.strip
    silence = talk.empty?
    yelling = talk.upcase == talk && talk.match?(/[A-Z]/)
    asking = talk.end_with?('?')

    if silence then
      return "Fine. Be that way!"
    end

    if yelling and asking then
      return "Calm down, I know what I'm doing!"
    end

    if asking then
      return "Sure."
    end

    if yelling then
      return "Whoa, chill out!"
    end

    return "Whatever."
  end
end