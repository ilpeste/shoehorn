# encoding: utf-8
module Shoehorn::Helpers
  module IconHelpers
    # Renders icons
    #
    # @param [Hash] options hash containing options (default: {}):
    #           :name         - The String type of alert to display: success warning important notice
    #           :text         - The String of a text to show inline with the icon
    #           :class        - The String additional CSS classes of the object
    #           :bootstrap_class_prefix - The String CSS class prefix from Twitter Bootstrap for the object
    #           :html_options - Any additional options you'd like to pass to the span tag that will be created
    #                           for this label (for instance :"data-whatever" can be specified in :html_options).
    #
    # Examples
    #
    #   bootstrap_icon(name: 'user', icon_white: true)
    #   # => '<i class="icon-user icon-white"></i>'
    #
    #   bootstrap_icon(text: "Current time", name: 'time')
    #   # => '<i class="icon-time"></i> Current time'
    #
    #   bootstrap_icon(class: "my_awesome_class", name: 'glass')
    #   # => '<i class="icon-glass my_awesome_class"></i>'
    #
    # Returns HTML String for the icons
    def bootstrap_icon(options = {})
      Shoehorn::Components::Icon.new(
        options
      ).to_s
    end

  end
end

