# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gibberish"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Percival"]
  s.date = "2011-12-09"
  s.description = "Supports OpenSSL compatible AES, HMAC, and RSA encryption"
  s.email = ["mark@markpercival.us"]
  s.homepage = "http://github.com/mdp/gibberish"
  s.require_paths = ["lib"]
  s.rubyforge_project = "gibberish"
  s.rubygems_version = "1.8.11"
  s.summary = "An opinionated ruby encryption library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
