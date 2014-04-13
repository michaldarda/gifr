# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gifr/version'

Gem::Specification.new do |spec|
  spec.name          = "gifr"
  spec.version       = Gifr::VERSION
  spec.authors       = ["Michał Darda"]
  spec.email         = ["michaldarda@gmail.com"]
  spec.summary       = %q{Simple solution to create gifs from short movies.}
  spec.description   = %q{Simple solution to create gifs from short movies.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0beta2"
  spec.add_development_dependency "aruba"

  spec.add_dependency "rmagick"
end
