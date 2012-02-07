# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rmagick"
  s.version = "2.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Hunter"]
  s.date = "2009-10-03"
  s.description = "RMagick is an interface between Ruby and ImageMagick."
  s.email = "rmagick@rubyforge.org"
  s.extensions = ["ext/RMagick/extconf.rb"]
  s.files = ["ext/RMagick/extconf.rb"]
  s.homepage = "http://rubyforge.org/projects/rmagick"
  s.require_paths = ["lib", "ext"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.5")
  s.requirements = ["ImageMagick 6.3.5 or later"]
  s.rubyforge_project = "rmagick"
  s.rubygems_version = "1.8.11"
  s.summary = "Ruby binding to ImageMagick"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
