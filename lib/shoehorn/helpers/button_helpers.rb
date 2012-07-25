# encoding: utf-8
module Shoehorn::Helpers
  module ButtonHelpers
    # Render a bootstrap button
    #
    # @param [String] text for the button face
    # @param [String] link for the button href
    # @param [Hash] options hash containing options (default: {}):
    #           :type         - The String type of button to display: primary, info, success, warning, danger or inverse
    #           :size          - The String size of button to display: large, small or mini
    #           :disabled     - Will disable the button if set to true
    #           :class        - The String additional CSS classes of the object
    #           :bootstrap_class_prefix - The String CSS class prefix from Twitter Bootstrap for the object
    #           :icon_name    - Specify an icon name from bootstrap to prepend
    #           :icon_white   - Specify true if you want the icon to be white
    #           :id            - Assign an ID to the button
    #           :html_options - Any additional options you'd like to pass to the content_tag that will be created
    #                           for this button's a tag (for instance :target can be specified in :html_options).
    #
    # NOTE:  If you have to create a link to a resource#show you have to specify the full path as second param.
    #        Example: to create an anchor to the user#show path you have to write:
    #                 bootstrap_button "Show", user_path(@user)
    #        instead of:
    #                 bootstrap_button "Show", @user
    #
    # Examples
    #
    #   bootstrap_button "Show", user_path(@user)
    #
    #   bootstrap_button t('commons.search'), user_path(@user)
    #
    #   bootstrap_button 'Search', search_path, type: 'primary', icon_name: 'search'
    #
    #   bootstrap_button 'Show details', user_path(@user), icon_name: 'user', size: 'large'
    #
    #   bootstrap_button 'Edit request', edit_request_path(@request), :type => 'primary', class: 'foo', id: 'bar'
    #
    #   bootstrap_button 'Show details', user_path(@user), disabled: true
    #
    def bootstrap_button(text, link, options = {})
      Shoehorn::Components::Button.new(
        text,
        link,
        options
      ).to_s
    end

    # Render a dropdown button
    #
    # @param [Hash] options hash containing options (default: {}):
    #
    # Examples
    #
    #   bootstrap_button_dropdown do |b|
    #     b.bootstrap_button "Actions', "#", type: 'primary'
    #     b.bootstrap_link_to "Show", request_path(@request), icon_name: 'zoom-in'
    #     b.bootstrap_link_to_if(can?(:reject, @request),  t('.refuse'),
    #                            reject_request_path(@request), icon_name: 'remove',
    #                            html_options: {  method: :put, data: { confirm: "Are you sure?" } }) { nil }
    #     b.bootstrap_link_to_if(can?(:accept, @request),  "Accept",
    #                            "#acceptModal_#{@request.id}", icon_name: 'ok',
    #                            html_options: {  data: { toggle: "modal" } }) { nil }
    #     b.link_to "Help", help_path
    #   end
    #
    # Returns HTML String for the dropdown
    def bootstrap_dropdown(options = {})
      # Elements will hold every call made to this block. Self is passed in so the
      # elements can be sent to it in order to be evaluated
      elements = Shoehorn::HelperCollection.new(self)

      yield elements

      Shoehorn::Components::Dropdown.new(
        elements,
        options
      ).to_s
    end

    # Render a bootstrap link_to.
    #
    # They are a shortcut to bootstrap_button with bootstrap_class_prefix => nil .
    # In this way they are rendered as normal links, without being styled.
    #
    def bootstrap_link_to(text, link, options = {})
      options[:bootstrap_class_prefix] = nil
      Shoehorn::Components::Button.new(
          text,
          link,
          options
      ).to_s
    end

    # Render a bootstrap link_to_unless.
    #
    # They are a shortcut to conditional bootstrap_button_link_to.
    # In this way they are rendered as normal links, without being styled.
    #
    def bootstrap_link_to_unless(condition, text, link, options = {}, &block)
      if condition
        if block_given?
          block.arity <= 1 ? capture(text, &block) : capture(text, link, options, &block)
        else
          text
        end
      else
        bootstrap_link_to(text, link, options)
      end
    end

    # Render a bootstrap link_to_unless.
    #
    # They are a shortcut to conditional bootstrap_button_link_to.
    # In this way they are rendered as normal links, without being styled.
    #
    def bootstrap_link_to_if(condition, text, link, options = {}, &block)
      bootstrap_link_to_unless !condition, text, link, options, &block
    end

  end
end

