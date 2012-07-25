# -*- encoding: utf-8 -*-
require File.expand_path('../lib/shoehorn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matteo Canato"]
  gem.email         = ["mcanato@gmail.com"]
  gem.description   = %q{Shoehorn: a Twitter Bootstrap 2.0 helper library for Rails - HTML, CSS, and JS toolkit from Twitter}
  gem.summary       = %q{Shoehorn: a Twitter Bootstrap 2.0 helper library for Rails - HTML, CSS, and JS toolkit from Twitter}
  gem.homepage      = "https://www.github.com/mcanato/shoehorn"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "shoehorn"
  gem.require_paths = ["lib"]
  gem.version       = Shoehorn::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_dependency "railties", "~> 3.0"
  gem.add_development_dependency "rails",              "~> 3.0"
  gem.add_development_dependency "rspec-rails",        "~> 2.10"
  gem.add_development_dependency "rspec_tag_matchers", ">= 1.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'yard-tomdoc'
  gem.add_development_dependency 'simple-navigation'

  if !defined?(RUBY_ENGINE) || RUBY_ENGINE != 'rbx'
    gem.add_development_dependency RUBY_VERSION =~ /^1\.9/ ? "simplecov" : "rcov"
  end
end

