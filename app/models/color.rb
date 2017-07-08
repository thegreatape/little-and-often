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

  def distance_from(other)
    # square root of the sum of the squares of the
    # differences between corresponding coordinates
    Math.sqrt(
      [
        (hue - other.hue)**2,
        ((saturation / 100) * 360 - (other.saturation / 100) * 360)**2,
        ((lightness / 100) * 360 - (other.lightness / 100) * 360)**2,
      ].sum
    )
  end

  def to_css
    "hsl(#{hue.to_i}, #{saturation.to_i}%, #{lightness.to_i}%)"
  end
end
