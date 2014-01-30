# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speechpad/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'faraday', '~> 0.8.8'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.author = 'Upworthy'
  spec.description = %q{A Ruby library for interacting with the Speechpad API}
  spec.email = 'webmaster@upworthy.com'
  spec.files = %w(.yardopts CONTRIBUTING.md LICENSE.md README.md Rakefile speechpad.gemspec)
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('spec/**/*')
  spec.homepage = 'https://github.com/upworthy/speechpad'
  spec.licenses = ['BSD-3-Clause']
  spec.name = 'speechpad'
  spec.require_paths = ['lib']
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary = spec.description
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.version = Speechpad::VERSION
end
