# -*- encoding: utf-8 -*-
# stub: qiniu 6.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "qiniu".freeze
  s.version = "6.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["why404".freeze, "BluntBlade".freeze]
  s.date = "2016-08-29"
  s.description = "Qiniu Resource (Cloud) Storage SDK for Ruby. See: http://developer.qiniu.com/docs/v6/sdk/ruby-sdk.html".freeze
  s.email = ["sdk@qiniu.com".freeze]
  s.homepage = "https://github.com/qiniu/ruby-sdk".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Qiniu Resource (Cloud) Storage SDK for Ruby".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.11"])
      s.add_development_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 2.0.0", "~> 2.0"])
      s.add_runtime_dependency(%q<mime-types>.freeze, [">= 2.4.0", "~> 2.4"])
      s.add_runtime_dependency(%q<ruby-hmac>.freeze, ["~> 0.4"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 0.9"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.11"])
      s.add_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_dependency(%q<rest-client>.freeze, [">= 2.0.0", "~> 2.0"])
      s.add_dependency(%q<mime-types>.freeze, [">= 2.4.0", "~> 2.4"])
      s.add_dependency(%q<ruby-hmac>.freeze, ["~> 0.4"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.11"])
    s.add_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<rest-client>.freeze, [">= 2.0.0", "~> 2.0"])
    s.add_dependency(%q<mime-types>.freeze, [">= 2.4.0", "~> 2.4"])
    s.add_dependency(%q<ruby-hmac>.freeze, ["~> 0.4"])
  end
end
