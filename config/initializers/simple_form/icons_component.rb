module SimpleForm
  module Components
    module Icons
      def icon(wrapper_options = nil)
        @icon ||= begin
          if options[:icon].present?
            "<i class='" + options[:icon] + " icon'></i>"
          end
        end
      end

      def has_icon?
        icon.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Icons)
