module SimpleForm
  module Inputs
    class TextInput < Base
      enable :placeholder, :maxlength, :minlength

      def input(wrapper_options = nil)
        merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

        @builder.text_area(attribute_name, merged_input_options)
      end
    end
  end
end
