# -*- encoding: utf-8 -*-
require File.expand_path('../lib/safety_patrol/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Brewer"]
  gem.email         = ["tom@21purple.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "safety_patrol"
  gem.require_paths = ["lib"]
  gem.version       = SafetyPatrol::VERSION
  gem.add_development_dependency('rspec')
end
