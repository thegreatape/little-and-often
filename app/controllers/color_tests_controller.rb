class ColorTestsController < ApplicationController
  def index
    @palettes = 20.times.map do
      palette = if params[:palette].present?
                  palette_params = {
                    minimum_hue_offset: params[:palette][:minimum_hue_offset].to_i,
                    lightness_jitter: params[:palette][:lightness_jitter].to_i,
                    saturation_jitter: params[:palette][:saturation_jitter].to_i,
                    minimum_color_distance: params[:palette][:minimum_color_distance].to_i
                  }
                  palette_params[:angles] = [
                    params[:palette][:first_angle],
                    params[:palette][:second_angle],
                    params[:palette][:third_angle]
                  ].compact.map(&:to_i)
                  palette_params[:ranges] = [
                    params[:palette][:first_range],
                    params[:palette][:second_range],
                    params[:palette][:third_range]
                  ].compact.map(&:to_i)
                  Palette.new(palette_params)
                else
                  Palette.elizabeth_custom
                end
      color = Color.new(
        rand * 360,
        (params[:palette].try(:[], :initial_saturation) || 30).to_i,
        (params[:palette].try(:[], :initial_lightness) || 50).to_i
      )
      palette.generate(existing_palette: [color], count: 15).map(&:to_css)
    end
  end
end
