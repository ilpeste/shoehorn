module Shoehorn::Helpers
  module FormHelpers
    # Form builder
    # TODO add documentation
    def bootstrap_form_for(*args, &block)
      options = args.extract_options!
      options.reverse_merge!(:builder => Shoehorn::Components::FormBuilder)
      form_for(*(args + [options]), &block)
    end
  end
end
