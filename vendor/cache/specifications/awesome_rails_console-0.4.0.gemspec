# -*- encoding: utf-8 -*-
# stub: awesome_rails_console 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "awesome_rails_console".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bruce Li".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-03-20"
  s.description = "Enhance rails console by using awesome_print, pry and several pry plugins. And useful prompt tweaks. Makes rails console awesome by default.".freeze
  s.email = ["ascendbruce@gmail.com".freeze]
  s.homepage = "https://github.com/ascendbruce/awesome_rails_console".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Simple and useful rails console enhancements".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<pry-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 0"])
      s.add_dependency(%q<pry-rails>.freeze, [">= 0"])
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 0"])
    s.add_dependency(%q<pry-rails>.freeze, [">= 0"])
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.9"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
  end
end
