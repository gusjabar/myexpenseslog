# -*- encoding: utf-8 -*-
# stub: heroku-api 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "heroku-api".freeze
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["geemus (Wesley Beary)".freeze, "Pedro Belo".freeze]
  s.date = "2016-03-02"
  s.description = "Ruby Client for the Heroku API".freeze
  s.email = ["wesley@heroku.com".freeze, "pedro@heroku.com".freeze]
  s.homepage = "http://github.com/heroku/heroku.rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Ruby Client for the Heroku API".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<excon>.freeze, ["~> 0.45"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.8"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<excon>.freeze, ["~> 0.45"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1.8"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<excon>.freeze, ["~> 0.45"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
