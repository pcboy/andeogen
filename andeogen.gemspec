# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'andeogen/version'

Gem::Specification.new do |spec|
  spec.name          = "andeogen"
  spec.version       = Andeogen::VERSION
  spec.authors       = ["pcboy"]
  spec.email         = ["david.hagege@gmail.com"]
  spec.description   = %q{Andeogen is a tiny gem to ease android layout development}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "WTFPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ["andeogen"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri"
  spec.add_dependency "awesome_print"
  spec.add_dependency "trollop"
end
