class SpaceAge
  attr_accessor :age
  
  def initialize(seconds)
    @age = seconds / 31557600.0
  end

  def on_earth
    @age
  end

  def on_mercury
    @age / 0.2408467
  end

  def on_venus
    @age / 0.61519726
  end

  def on_mars
    @age / 1.8808158
  end

  def on_jupiter
    @age / 11.862615
  end

  def on_saturn
    @age / 29.447498
  end

  def on_uranus
    @age / 84.016846
  end

  def on_neptune
    @age / 164.79132
  end
end
