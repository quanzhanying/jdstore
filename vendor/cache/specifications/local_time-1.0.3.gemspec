# -*- encoding: utf-8 -*-
# stub: local_time 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "local_time".freeze
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Javan Makhmali".freeze, "Sam Stephenson".freeze]
  s.date = "2015-08-30"
  s.email = "javan@basecamp.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Rails engine for cache-friendly, client-side local time".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<coffee-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails-dom-testing>.freeze, [">= 0"])
      s.add_development_dependency(%q<blade>.freeze, ["~> 0.3.0"])
      s.add_development_dependency(%q<blade-sauce_labs_plugin>.freeze, ["~> 0.3.0"])
    else
      s.add_dependency(%q<coffee-rails>.freeze, [">= 0"])
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<rails-dom-testing>.freeze, [">= 0"])
      s.add_dependency(%q<blade>.freeze, ["~> 0.3.0"])
      s.add_dependency(%q<blade-sauce_labs_plugin>.freeze, ["~> 0.3.0"])
    end
  else
    s.add_dependency(%q<coffee-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<rails-dom-testing>.freeze, [">= 0"])
    s.add_dependency(%q<blade>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<blade-sauce_labs_plugin>.freeze, ["~> 0.3.0"])
  end
end
