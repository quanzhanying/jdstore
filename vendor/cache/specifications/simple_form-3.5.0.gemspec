# -*- encoding: utf-8 -*-
# stub: simple_form 3.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_form".freeze
  s.version = "3.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jos\u{e9} Valim".freeze, "Carlos Ant\u{f4}nio".freeze, "Rafael Fran\u{e7}a".freeze]
  s.date = "2017-05-17"
  s.description = "Forms made easy!".freeze
  s.email = "opensource@plataformatec.com.br".freeze
  s.homepage = "https://github.com/plataformatec/simple_form".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "simple_form".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Forms made easy!".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>.freeze, ["< 5.2", "> 4"])
      s.add_runtime_dependency(%q<actionpack>.freeze, ["< 5.2", "> 4"])
    else
      s.add_dependency(%q<activemodel>.freeze, ["< 5.2", "> 4"])
      s.add_dependency(%q<actionpack>.freeze, ["< 5.2", "> 4"])
    end
  else
    s.add_dependency(%q<activemodel>.freeze, ["< 5.2", "> 4"])
    s.add_dependency(%q<actionpack>.freeze, ["< 5.2", "> 4"])
  end
end
