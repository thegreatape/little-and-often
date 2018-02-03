class ColorTestsController < ApplicationController
  def index
    @palettes = 20.times.map do
      palette = if params[:palette].present?
                  palette_params = params[:palette].permit!.to_h.symbolize_keys.slice(
                    :lightness_jitter,
                    :saturation_jitter,
                    :minimum_color_distance,
                    :initial_lightness,
                    :initial_saturation
                  )
                  palette_params.transform_values!(&:to_i)
                  palette_params[:angle_offset] = (0..360).to_a.sample
                  palette_params[:angles] = angle_params
                  palette_params[:ranges] = range_params
                  Palette.new(palette_params)
                else
                  Palette.elizabeth_custom
                end
    end
  end

  private

  def range_params
    return [] unless params[:palette].present?

    [
      params[:palette][:first_range],
      params[:palette][:second_range],
      params[:palette][:third_range]
    ].select(&:present?).map(&:to_i)
  end

  def angle_params
    return [] unless params[:palette].present?

    [
      params[:palette][:first_angle],
      params[:palette][:second_angle],
      params[:palette][:third_angle]
    ].select(&:present?).map(&:to_i)

  end

  def wheel_ranges(palette)
    palette.angles.zip(palette.ranges)
  end
  helper_method :wheel_ranges
end
