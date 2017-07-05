module ColorTestsHelper
  def palette_field(f, name)
    f.input name, as: :integer, required: false, input_html: {value: params[:palette].try(:[], name)}
  end
end
