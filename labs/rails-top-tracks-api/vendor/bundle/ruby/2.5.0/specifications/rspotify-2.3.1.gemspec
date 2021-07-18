# -*- encoding: utf-8 -*-
# stub: rspotify 2.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rspotify".freeze
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Guilherme Sad".freeze]
  s.date = "2018-10-20"
  s.email = ["gorgulhoguilherme@gmail.com".freeze]
  s.homepage = "http://rubygems.org/gems/rspotify".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A ruby wrapper for the Spotify Web API".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.3.1"])
      s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.3.1"])
      s.add_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<vcr>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.3.1"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 2.0.2"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0"])
  end
end
