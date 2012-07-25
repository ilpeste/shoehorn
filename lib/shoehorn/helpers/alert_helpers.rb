# encoding: utf-8

module Shoehorn::Helpers
  module AlertHelpers
    # Renders alert message
    #
    # @param [String] message message to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :block        - The Boolean whether to display as a block (optional)
    #           :close        - The Boolean whether to render close button
    #           :heading      - The String heading message to render
    #           :dismiss      - The Boolean whether to add dismiss attribute
    #           :type         - The String type of alert to display: error, success or info
    #           :html_options - Any additional HTML options desired on the alert DIV.
    #
    # Examples
    #
    #   bootstrap_alert("Hello!")
    #   # => '<div class="alert"><a class="close">×</a>Hello!</div>'
    #
    #   bootstrap_alert("Hello!", type: 'error', close: false)
    #   # => '<div class="alert alert-error">Hello!</div>'
    #
    #   bootstrap_alert("Content of alert", heading: "WARNING!", type: 'info')
    #   # => '<div class="alert alert-info"><a class="close">×</a>
    #            <h4 class="alert-heading">WARNING!</h4>Content of alert</div>'
    #
    # Returns HTML String for the alert
    def bootstrap_alert(message, options = {})
      Shoehorn::Components::Alert.new(
        message,
        options
      ).to_s
    end
  end
end

