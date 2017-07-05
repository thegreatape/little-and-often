class Color
  attr_reader :hue, :saturation, :lightness

  def initialize(hue, saturation, lightness)
    @hue = hue
    @saturation = saturation
    @lightness = lightness
  end

  def self.random
    new(rand * 360, rand * 100, rand * 100)
  end

  def to_css
    "hsl(#{hue.to_i}, #{saturation.to_i}%, #{lightness.to_i}%)"
  end
end
