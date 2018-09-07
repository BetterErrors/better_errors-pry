# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_errors/pry/version'

Gem::Specification.new do |spec|
  spec.name          = "better_errors-pry"
  spec.version       = BetterErrors::Pry::VERSION
  spec.authors       = ["Charlie Somerville", "Robin Daugherty"]
  spec.email         = ["charlie@charliesomerville.com", "robin@robindaugherty.net"]

  spec.summary       = %q{Add Pry support to Better Errors}
  spec.description   = %q{Addon to Better Errors that adds Pry to the REPL.}
  spec.homepage      = "https://github.com/RobinDaugherty/better_errors-pry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|gemfiles)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "better_errors", '~> 2.3', '>= 2.3.0'
  spec.add_dependency "pry", ">= 0.9"
  spec.add_dependency "binding_of_caller"
end
