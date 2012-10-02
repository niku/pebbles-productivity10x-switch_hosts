# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pebbles-productivity10x-switch_hosts/version'

Gem::Specification.new do |gem|
  gem.name          = "pebbles-productivity10x-switch_hosts"
  gem.version       = Pebbles::Productivity10x::SwitchHosts::VERSION
  gem.authors       = ["niku"]
  gem.email         = ["niku@niku.name"]
  gem.description   = %q{Write a gem description}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
