# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "xml_formatter_ST_Codex"
  s.version     = "0.1.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Hibat Allah OUNIFI"]
  s.email       = ["hibat.allah.batoul@gmail.com"]
  s.homepage    = "http://github.com/HibatAllah / Xml_formatter_ST_Codex"
  s.summary     = "RSpec JUnit XML formatter"
  s.description = "RSpec results that Hudson can read."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "rspec", "~> 2.0"
  s.add_dependency "builder"

  s.files        = Dir["lib/**/*"] + %w[README.md LICENSE]
  s.require_path = 'lib'
end
