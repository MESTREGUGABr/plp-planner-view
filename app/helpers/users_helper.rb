module UsersHelper

  def input_with_icon(form, field_name, icon_path, placeholder)
    # Lê o conteúdo do SVG
    icon_url = image_url icon_path

    input_field = form.text_field(field_name, class: 'form-control custom-input', placeholder: placeholder,
                                  style: "background-image: url('#{icon_url}')")

    "<div class='form-group'>#{input_field}</div>".html_safe
  end



  def password_input_with_icon(form, field_name, icon_path, placeholder)
    icon_url = image_url icon_path

    input_field = form.password_field(field_name, class: 'form-control custom-input', placeholder: placeholder,
                                      style: "background-image: url('#{icon_url}')")

    "<div class='form-group'>#{input_field}</div>".html_safe
  end

end
