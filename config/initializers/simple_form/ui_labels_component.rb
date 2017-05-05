module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module UiLabel
      # Name of the component method
      def ui_label(wrapper_options = nil)
        @ui_label ||= begin
          if options[:ui_label].present?
            "<div class='ui basic label' >" + options[:ui_label].to_s.html_safe + "</div>"
          end
        end
      end

      # Used when the number is optional
      def has_ui_label?
        ui_label.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::UiLabel)
