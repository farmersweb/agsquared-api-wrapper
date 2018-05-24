# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'agsquared-api-wrapper/version'

Gem::Specification.new do |gem|
  gem.name          = "agsquared-api-wrapper"
  gem.version       = AgsquaredApiWrapper::VERSION
  gem.authors       = ["John Barton"]
  gem.email         = ["jb@phy5ics.com"]
  gem.description   = %q{A wrapper for the AgSquared API.}
  gem.summary       = %q{A wrapper for the AgSquared API.}
  gem.homepage      = "https://github.com/farmersweb/agsquared-api-wrapper"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'faraday', '>= 0.8.4'
  gem.add_dependency 'faraday_middleware', '>= 0.8.4'
  gem.add_dependency 'hashie', '>= 1.2'
  gem.add_dependency 'multi_json', '>= 1.3'
  gem.add_dependency 'simple_oauth'
  
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'dotenv'
end
