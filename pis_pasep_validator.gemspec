# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pis_pasep_validator/version"

Gem::Specification.new do |s|
  s.name        = "pis_pasep_validator"
  s.version     = PisPasepValidator::VERSION
  s.authors     = ["Ricardo H."]
  s.email       = ["ricardohsd@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{PIS/PASEP validator for ActiveModel}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel', '>= 3.0'
  s.add_development_dependency 'rake', '>= 0.8.7'
end
