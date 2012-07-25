module Shoehorn::Components
  class ProgressBar < Base
    attr_accessor :width

    def initialize(width, options = {})
      super
      @width = width
    end

    def to_s
      output_buffer << content_tag(:div, build_div_options) do
        build_bar_tag.html_safe
      end.html_safe
      super
    end

    private

    def default_options
      {
        :class        => nil,
        :bootstrap_class_prefix => "progress",
        :striped      => false,
        :animated     => false,
        :type          => nil,
        :html_options => {}
      }
    end

    def build_class
      classes = [ options[:class] ]
      classes << options[:bootstrap_class_prefix]
      classes << "#{options[:bootstrap_class_prefix]}-#{options[:type]}" if options[:type]
      classes << "#{options[:bootstrap_class_prefix]}-striped" if options[:striped]
      classes << "active" if options[:animated]
      classes.join(" ")
    end

    def build_bar_tag
      ops = { :class => 'bar', :style => "width: #{@width}%;" }
      content_tag(:div, nil, ops)
    end

    def build_div_options
      ops = { :class => build_class }
      ops.reverse_merge(options[:html_options])
    end


  end
end
