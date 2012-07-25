# encoding: utf-8

module Shoehorn::Helpers
  module ModalHelpers

    # Render a modal popup
    #
    # @param [Hash] options hash containing options (default: { :dom_id => 'twitter-bootstrap-modal', :fade => false, :header_title => '' }):
    #            :id       - DOM ID of the modal element (mandatory).
    #            :fade     - if true, add the fade class to the modal DOM element so the modal will be animated when shown.
    #            :title    - modal title.
    #
    # @example
    #   bootstrap_modal(id: "a_dom_id", fade: true, title: "Modal title!") do |modal|
    #     modal.body do |c|
    #       c.render partial: 'disclamer'
    #     end
    #     modal.footer do |c|
    #       c.bootstrap_button "Close", "#", type: 'danger', html_options: { data: { dismiss: "modal" } }
    #       c.bootstrap_button "Accept",  accept_request_path(@request),
    #                          icon_name: 'ok', type: 'success',
    #                          html_options: { data: { dismiss: "modal" }, method: :put }
    #     end
    #   end
    #
    # @example To render the button to show the modal use:
    #   bootstrap_button "Show Modal", "#a_dom_id", :html_options => { data: { toggle: "modal" }}
    #
    # Returns HTML String for the modal popup
    def bootstrap_modal(options = {})
      elements = Shoehorn::HelperCollectionSet.new(self, [:body, :footer])
      
      yield elements

      Shoehorn::Components::Modal.new(
        elements.collections[:body],
        elements.collections[:footer],
        options
      ).to_s
    end
    
  end
end
