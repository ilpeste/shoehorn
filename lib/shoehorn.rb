$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

module Shoehorn
  require "shoehorn/version"

  require "shoehorn/helper_collection"
  require "shoehorn/helper_collection_set"

  autoload :Helpers, "shoehorn/helpers"
  autoload :Components, "shoehorn/components"

  require "shoehorn/engine" if defined?(::Rails)
  require "shoehorn/plugins"
end

