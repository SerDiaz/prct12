# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct12/version'

Gem::Specification.new do |spec|
  spec.name = "prct12"
  spec.version = Prct12::VERSION
  spec.authors = ["Iván García", "Sergio Diaz"]
  spec.email = ["alu0100693737@ull.edu.es", "alu0100696615@ull.edu.es"]
  spec.description = %q{Gestion de matrices densas y dispersas con mayor eficiencia en uso de memoria.}
  spec.summary = %q{Gestion de matrices densas y dispersas.}
  spec.homepage = "https://github.com/alu0100696615/prct12"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end

