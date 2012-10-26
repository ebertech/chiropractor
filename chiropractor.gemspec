# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chiropractor/version'

Gem::Specification.new do |gem|
  gem.name          = "chiropractor"
  gem.version       = Chiropractor::VERSION
  gem.authors       = ["Andrew Eberbach"]
  gem.email         = ["andrew@ebertech.ca"]
  gem.description   = %q{A helpful collection of tools to help your Backbone}
  gem.summary       = %q{A helpful collection of tools to help your Backbone}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency "backbone-on-rails"
  gem.add_runtime_dependency "marionette-rails"
  gem.add_runtime_dependency "coffee-rails"
  gem.add_runtime_dependency "jquery-rails"
end
