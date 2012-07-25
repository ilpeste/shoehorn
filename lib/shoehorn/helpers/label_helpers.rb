# encoding: utf-8
module Shoehorn::Helpers
  module LabelHelpers
    # Renders inline label
    #
    # @param [String] message message to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :type         - The String type of alert to display: info, success, warning, important or inverse
    #           :class        - The String additional CSS classes of the object
    #           :bootstrap_class_prefix - The String CSS class prefix from Twitter Bootstrap for the object
    #           :html_options - Any additional options you'd like to pass to the span tag that will be created
    #                           for this label (for instance :"data-whatever" can be specified in :html_options).
    #
    # Examples
    #
    #   bootstrap_label("Hello!")
    #   # => '<span class="label">Hello!</span>'
    #
    #   bootstrap_label("Hello!", type: 'warning')
    #   # => '<span class="label label-warning">Hello!</span>'
    #
    #   bootstrap_label("Hello!", type: 'important', class: "my_awesome_class")
    #   # => '<span class="my_awesome_class label label-important">Hello!</span>'
    #
    #   bootstrap_label("Hello!", type: 'info', bootstrap_class_prefix: "my_label")
    #   # => '<span class="my_label my_label-info">Hello!</span>'
    #
    # Returns HTML String for the label
    def bootstrap_label(message, options = {})
      Shoehorn::Components::Label.new(
        message,
        options
      ).to_s
    end
  end
end

