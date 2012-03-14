# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "thinking-sphinx"
  s.version = "2.0.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Allan"]
  s.date = "2012-01-01"
  s.description = "A concise and easy-to-use Ruby library that connects ActiveRecord to the Sphinx search daemon, managing configuration, indexing and searching."
  s.email = ["pat@freelancing-gods.com"]
  s.homepage = "http://freelancing-god.github.com/ts/en/"
  s.post_install_message = "If you're upgrading, you should read this:\nhttp://freelancing-god.github.com/ts/en/upgrading.html\n\n"
  s.require_paths = ["lib"]
  s.rubyforge_project = "thinking-sphinx"
  s.rubygems_version = "1.8.11"
  s.summary = "ActiveRecord/Rails Sphinx library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.3"])
      s.add_runtime_dependency(%q<riddle>, [">= 1.5.0"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_development_dependency(%q<actionpack>, [">= 3.0.3"])
      s.add_development_dependency(%q<cucumber>, ["= 1.0.2"])
      s.add_development_dependency(%q<faker>, ["= 0.3.1"])
      s.add_development_dependency(%q<ginger>, ["= 1.2.0"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec>, ["= 2.6.0"])
      s.add_development_dependency(%q<will_paginate>, ["= 3.0"])
      s.add_development_dependency(%q<yard>, [">= 0.7.2"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.3"])
      s.add_dependency(%q<riddle>, [">= 1.5.0"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<actionpack>, [">= 3.0.3"])
      s.add_dependency(%q<cucumber>, ["= 1.0.2"])
      s.add_dependency(%q<faker>, ["= 0.3.1"])
      s.add_dependency(%q<ginger>, ["= 1.2.0"])
      s.add_dependency(%q<rake>, [">= 0.9.2"])
      s.add_dependency(%q<rspec>, ["= 2.6.0"])
      s.add_dependency(%q<will_paginate>, ["= 3.0"])
      s.add_dependency(%q<yard>, [">= 0.7.2"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.3"])
    s.add_dependency(%q<riddle>, [">= 1.5.0"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<actionpack>, [">= 3.0.3"])
    s.add_dependency(%q<cucumber>, ["= 1.0.2"])
    s.add_dependency(%q<faker>, ["= 0.3.1"])
    s.add_dependency(%q<ginger>, ["= 1.2.0"])
    s.add_dependency(%q<rake>, [">= 0.9.2"])
    s.add_dependency(%q<rspec>, ["= 2.6.0"])
    s.add_dependency(%q<will_paginate>, ["= 3.0"])
    s.add_dependency(%q<yard>, [">= 0.7.2"])
  end
end
