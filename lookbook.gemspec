# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lookbook/version'

Gem::Specification.new do |spec|
  spec.name          = "lookbook"
  spec.version       = Lookbook::VERSION
  spec.authors       = ["Jiahao Li"]
  spec.email         = ["isundaylee.reg@gmail.com"]
  spec.description   = %q{A gem that collects newest looks from all cloth stores! }
  spec.summary       = %q{This is a gem that can fetch the newest styles from online cloth ctores. Extensible! }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_girl"

  # Use ActiveRecord and related
  spec.add_dependency "activerecord"
  spec.add_dependency "sqlite3"
end
