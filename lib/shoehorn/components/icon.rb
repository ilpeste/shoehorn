module Shoehorn::Components
  class Icon < Base

    def initialize(options = {})
      super
    end

    def to_s
      output_buffer << content_tag(:i, nil, build_tag_options).html_safe
      output_buffer << ' ' << text if options[:text]
      super
    end

    private
    def default_options
      {
        :class         => nil,
        :bootstrap_class_prefix => "icon",
        :text          => nil,
        :name          => nil,
        :icon_white   => false,
        :html_options => {}
      }
    end

    def build_class
      classes = [ options[:class] ]
      classes << options[:bootstrap_class_prefix]
      classes << "#{options[:bootstrap_class_prefix]}-#{options[:name]}" if options[:name]
      classes << "#{options[:bootstrap_class_prefix]}-white"             if options[:icon_white]
      classes.join(" ")
    end

    def build_tag_options
      ops = {:class => build_class}
      ops.reverse_merge(options[:html_options])
    end
  end
end

