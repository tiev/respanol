# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'respanol/version'

Gem::Specification.new do |s|
  s.name = 'respanol'
  s.version = Respanol::VERSION
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.authors = ['Drake Tran']
  s.email = ['tievdrake@gmail.com']
  s.summary = 'Makes learning Spanish fun and easy!'
  s.description = 'Makes learning Spanish fun and easy! With all the core and tests'
  s.homepage = 'https://github.com/tiev/respanol'

  s.required_ruby_version = '>= 1.9.0'

  s.add_runtime_dependency 'glosbe', '~> 0.0'
  s.add_development_dependency 'guard', '~> 2.0'
  s.add_development_dependency 'guard-bundler', '~> 2.0'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'simplecov', '~> 0.14'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]
end
