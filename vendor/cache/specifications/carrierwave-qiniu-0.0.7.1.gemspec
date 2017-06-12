# -*- encoding: utf-8 -*-
# stub: carrierwave-qiniu 0.0.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-qiniu".freeze
  s.version = "0.0.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["huobazi".freeze]
  s.date = "2013-07-18"
  s.description = "Qiniu Storage support for CarrierWave".freeze
  s.email = ["huobazi@gmail.com".freeze]
  s.homepage = "https://github.com/huobazi/carrierwave-qiniu".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Qiniu Storage support for CarrierWave".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<carrierwave>.freeze, [">= 0"])
      s.add_development_dependency(%q<qiniu-rs>.freeze, ["~> 3.4.2"])
    else
      s.add_dependency(%q<carrierwave>.freeze, [">= 0"])
      s.add_dependency(%q<qiniu-rs>.freeze, ["~> 3.4.2"])
    end
  else
    s.add_dependency(%q<carrierwave>.freeze, [">= 0"])
    s.add_dependency(%q<qiniu-rs>.freeze, ["~> 3.4.2"])
  end
end
