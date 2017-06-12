# -*- encoding: utf-8 -*-
# stub: carrierwave-qiniu 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-qiniu".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Marble Wu".freeze]
  s.date = "2017-03-01"
  s.description = "Qiniu Storage support for CarrierWave".freeze
  s.email = ["huobazi@gmail.com".freeze]
  s.homepage = "https://github.com/huobazi/carrierwave-qiniu".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Qiniu Storage support for CarrierWave".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<carrierwave>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<qiniu>.freeze, [">= 6.8.0", "~> 6.8"])
    else
      s.add_dependency(%q<carrierwave>.freeze, ["~> 1.0"])
      s.add_dependency(%q<qiniu>.freeze, [">= 6.8.0", "~> 6.8"])
    end
  else
    s.add_dependency(%q<carrierwave>.freeze, ["~> 1.0"])
    s.add_dependency(%q<qiniu>.freeze, [">= 6.8.0", "~> 6.8"])
  end
end
