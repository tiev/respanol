# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'respanol/version'

Gem::Specification.new do |s|
  s.name = 'respanol'
  s.version = Respanol::VERSION
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.authors = ['Drake Tran']
  s.email = ['phuocviet89@gmail.com']
  s.summary = 'Makes learning Spanish fun and easy!'
  s.description = 'Makes learning Spanish fun and easy!'

  s.required_ruby_version = '>= 1.9.0'

  s.add_dependency 'glosbe', ">= 0.0.10"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]
end
