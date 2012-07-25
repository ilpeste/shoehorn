module Shoehorn::Components
  class Form < Base
    autoload :InputField, 'shoehorn/components/form/input_field'
    autoload :Label, 'shoehorn/components/form/label'

    include ActionView::Helpers::FormHelper

    protected

    def default_options
      {}
    end
  end
end