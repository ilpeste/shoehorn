# encoding: utf-8
module Shoehorn::Helpers
  module BadgeHelpers
    # Renders badge
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
    #   bootstrap_badge("Hello!")
    #   # => '<span class="badge">Hello!</span>'
    #
    #   bootstrap_badge("Hello!", type: 'success')
    #   # => '<span class="badge badge-success">Hello!</span>'
    #
    #   bootstrap_badge("Hello!", type: 'warning', class: "my_awesome_class")
    #   # => '<span class="my_awesome_class badge badge-warning">Hello!</span>'
    #
    #   bootstrap_badge("Hello!", type: 'info', bootstrap_class_prefix: "my_badge")
    #   # => '<span class="my_badge my_badge-warning">Hello!</span>'
    #
    # Returns HTML String for the badge
    def bootstrap_badge(message, options = {})
      Shoehorn::Components::Badge.new(
        message,
        options
      ).to_s
    end

  end
end

