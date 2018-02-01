class ColorTestsController < ApplicationController
  def index
    @palettes = 20.times.map do
      palette = if params[:palette].present?
                  palette_params = {
                    lightness_jitter: params[:palette][:lightness_jitter].to_i,
                    saturation_jitter: params[:palette][:saturation_jitter].to_i,
                    minimum_color_distance: params[:palette][:minimum_color_distance].to_i
                  }
                  palette_params[:angles] = angle_params
                  palette_params[:ranges] = range_params
                  Palette.new(palette_params)
                else
                  Palette.elizabeth_custom
                end
      palette.generate(count: 15).map(&:to_css)
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

  def wheel_ranges
    angle_params.zip(range_params)
  end
  helper_method :wheel_ranges
end
