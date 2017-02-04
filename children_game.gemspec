# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'children_game/version'

Gem::Specification.new do |spec|
  spec.name          = "children_game"
  spec.version       = ChildrenGame::VERSION
  spec.authors       = ["harry gao"]
  spec.email         = ["foxgaocn@gmail.com"]

  spec.summary       = %q{A solution to remove the k'th child from a circle.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 2.4"
  spec.add_development_dependency "aruba", "~> 0.14"
end
