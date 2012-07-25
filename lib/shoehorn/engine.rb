require 'rails'

module Shoehorn
  class Engine < ::Rails::Engine
    initializer 'shoehorn.initialize' do
      ActiveSupport.on_load(:action_view) do
        include Shoehorn::Helpers::AlertHelpers
        include Shoehorn::Helpers::LabelHelpers
        include Shoehorn::Helpers::IconHelpers
        include Shoehorn::Helpers::BadgeHelpers
        #include Shoehors::Helpers::FormHelpers
        include Shoehorn::Helpers::ButtonHelpers
        include Shoehorn::Helpers::NavigationHelpers
        include Shoehorn::Helpers::ModalHelpers
        include Shoehorn::Helpers::ProgressBarHelpers
      end
    end
  end
end