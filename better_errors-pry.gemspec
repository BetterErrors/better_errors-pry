# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_errors/pry/version'

Gem::Specification.new do |spec|
  spec.name          = "better_errors-pry"
  spec.version       = BetterErrors::Pry::VERSION
  spec.authors       = ["Robin Daugherty"]
  spec.email         = ["robin@robindaugherty.net"]

  spec.summary       = %q{Add Pry support to Better Errors}
  spec.description   = %q{Addon to Better Errors that adds Pry to the REPL.}
  spec.homepage      = "https://github.com/RobinDaugherty/better_errors-pry"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"

  spec.add_dependency "better_errors", "~> 3.0"
  spec.add_dependency "pry", ">= 0.10"
  spec.add_dependency "binding_of_caller"
end
