class Palette
  attr_reader :angles, :ranges, :saturation_jitter, :lightness_jitter, :minimum_color_distance, :initial_saturation, :initial_lightness
  def initialize(angles:, ranges:, lightness_jitter: 0, saturation_jitter: 0, angle_jitter: 360, minimum_color_distance: 0, initial_saturation: 30, initial_lightness: 50)
    if angles.count != ranges.count
      raise "Palette must be passed same number of angles and ranges"
    end

    angle_offset = rand(angle_jitter).to_i
    @angles = angles.map {|a| a + angle_offset}
    @ranges = ranges
    @saturation_jitter = saturation_jitter
    @lightness_jitter = lightness_jitter
    @minimum_color_distance = minimum_color_distance
    @initial_saturation = initial_saturation
    @initial_lightness = initial_lightness
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
    existing_palette ||= [random_color_within_slices]
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

  def random_color_within_slices
      color = Color.new(
        rand(degree_ranges.sample),
        initial_saturation || 30,
        initial_lightness || 50
      )
  end

  def degree_ranges
    angles.zip(ranges).map{|p| (p[0]..(p[0]+ p[1]))}
  end

  def next_color(color)
    slice_index = rand(angles.count).to_i
    hue = angles[slice_index] + rand(ranges[slice_index])
    saturation_offset = ((rand * saturation_jitter * 2) - saturation_jitter)
    lightness_offset = ((rand * lightness_jitter * 2) - lightness_jitter)
    Color.new(
      hue % 360,
      color.saturation + saturation_offset,
      color.lightness + lightness_offset
    )
  end
end
