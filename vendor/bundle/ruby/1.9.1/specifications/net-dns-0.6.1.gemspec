# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "net-dns"
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marco Ceresa", "Simone Carletti"]
  s.date = "2010-01-17"
  s.description = "Net::DNS is a pure Ruby DNS library, with a clean OO interface and an extensible API"
  s.email = ["ceresa@gmail.com", "weppos@weppos.net"]
  s.extra_rdoc_files = ["AUTHORS.rdoc", "CHANGELOG.rdoc", "README.rdoc", "THANKS.rdoc"]
  s.files = ["AUTHORS.rdoc", "CHANGELOG.rdoc", "README.rdoc", "THANKS.rdoc"]
  s.homepage = "http://github.com/bluemonk/net-dns"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "net-dns"
  s.rubygems_version = "1.8.11"
  s.summary = "Pure Ruby DNS library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end
