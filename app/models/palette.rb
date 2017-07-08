class Palette
  attr_reader :angles, :ranges, :saturation_jitter, :lightness_jitter, :minimum_hue_offset, :minimum_color_distance
  def initialize(angles:, ranges:, lightness_jitter: 0, saturation_jitter: 0, minimum_hue_offset: 0, minimum_color_distance: 0)
    if angles.count != ranges.count
      raise "Palette must be passed same number of angles and ranges"
    end

    @angles = angles
    @ranges = ranges
    @saturation_jitter = saturation_jitter
    @lightness_jitter = lightness_jitter
    @minimum_hue_offset = minimum_hue_offset
    @minimum_color_distance = minimum_color_distance
  end

  def self.triad
    new(angles: [0, 120, 240],
        ranges: [15, 15, 15],
        minimum_hue_offset: 10,
        lightness_jitter: 5,
        saturation_jitter: 5)
  end

  def self.elizabeth_custom
    new(angles: [0, 70, 310],
        ranges: [50, 50, 50],
        minimum_hue_offset: 10,
        lightness_jitter: 20,
        saturation_jitter: 10,
        minimum_color_distance: 5)
  end

  def generate(count:, existing_palette: nil)
    existing_palette ||= [Color.random]
    max_retries = 100

    while count > 0
      new_color = next_color(existing_palette.first)
      if max_retries == 0 || existing_palette.all? {|c| c.distance_from(new_color) >= minimum_color_distance }
        existing_palette << new_color
        count -= 1
      else
        max_retries -= 1
      end
    end
    existing_palette
  end

  def next_color(color)
    slice_index = rand(angles.count).to_i
    hue_offset = [angles[slice_index] + rand(ranges[slice_index]), minimum_hue_offset].max
    saturation_offset = ((rand * saturation_jitter * 2) - saturation_jitter)
    lightness_offset = ((rand * lightness_jitter * 2) - lightness_jitter)
    Color.new(
      (color.hue + hue_offset) % 360,
      color.saturation + saturation_offset,
      color.lightness + lightness_offset
    )
  end
end
