# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'food_junkie/version'

Gem::Specification.new do |gem|
  gem.name          = "food-junkie"
  gem.version       = FoodJunkie::VERSION
  gem.authors       = ["Noah H. Smith"]
  gem.email         = ["noah@batteredoats.com"]
  gem.summary       = %q{Recipe Parsing Genius}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "ruby-units", "1.4.1"
  gem.add_dependency "treetop", "1.4.10"

  gem.add_development_dependency "rspec"
end
