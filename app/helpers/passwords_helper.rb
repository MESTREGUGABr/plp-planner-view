module PasswordsHelper

    def input_with_icon(form, field_name, icon, placeholder)
        form.text_field field_name, 
          placeholder: placeholder,
          class: 'custom-input',
          aria: { describedby: "#{field_name}_icon" } +
          (icon.present? ? " style='background-image: url(#{asset_path(icon)})'" : '')
      end
    
      def password_input_with_icon(form, field_name, icon, placeholder)
        form.password_field field_name, 
          placeholder: placeholder,
          class: 'custom-input',
          aria: { describedby: "#{field_name}_icon" } +
          (icon.present? ? " style='background-image: url(#{asset_path(icon)})'" : '')
      end
      
end
