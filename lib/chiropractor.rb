require "backbone-on-rails"
require "marionette-rails"
require "coffee-rails"
require "jquery-rails"

module Chiropractor
  autoload :Engine, 'chiropractor/engine'
  autoload :VERSION, 'chiropractor/version'
end

Chiropractor::Engine