# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "eaal"
  s.version = "0.1.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Petermann"]
  s.date = "2012-10-21"
  s.description = "EAAL (Eve API Access Layer) is a ruby library for accessing data of the API of\nthe game Eve Online"
  s.email = ["ppetermann80@googlemail.com"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.rdoc"]
  s.homepage = "http://eaal.rubyforge.org"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "eaal"
  s.rubygems_version = "1.8.23"
  s.summary = "EAAL (Eve API Access Layer) is a ruby library for accessing data of the API of the game Eve Online"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.6"])
      s.add_runtime_dependency(%q<memcache-client>, [">= 1.7.1"])
      s.add_runtime_dependency(%q<faraday>, [">= 0.8.4"])
      s.add_development_dependency(%q<hoe>, [">= 0"])
      s.add_development_dependency(%q<hoe-gemspec>, [">= 0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.6"])
      s.add_dependency(%q<memcache-client>, [">= 1.7.1"])
      s.add_dependency(%q<faraday>, [">= 0.8.4"])
      s.add_dependency(%q<hoe>, [">= 0"])
      s.add_dependency(%q<hoe-gemspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.6"])
    s.add_dependency(%q<memcache-client>, [">= 1.7.1"])
    s.add_dependency(%q<faraday>, [">= 0.8.4"])
    s.add_dependency(%q<hoe>, [">= 0"])
    s.add_dependency(%q<hoe-gemspec>, [">= 0"])
  end
end
