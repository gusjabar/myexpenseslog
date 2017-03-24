# -*- encoding: utf-8 -*-
# stub: bootbox-rails 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bootbox-rails".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrew Kozloff".freeze]
  s.date = "2015-05-12"
  s.description = "Wrappers for JavaScript alert(), confirm() and other flexible dialogs using Twitter's bootstrap framework for Rails 3.1+".freeze
  s.email = ["demerest@gmail.com".freeze]
  s.homepage = "https://github.com/tanraya/bootbox-rails".freeze
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Wrappers for JavaScript alert(), confirm() and other flexible dialogs using Twitter's bootstrap framework for Rails 3.1+".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<gem-release>.freeze, [">= 0.4.1"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<rails>.freeze, ["~> 3.1"])
      s.add_dependency(%q<gem-release>.freeze, [">= 0.4.1"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<rails>.freeze, ["~> 3.1"])
    s.add_dependency(%q<gem-release>.freeze, [">= 0.4.1"])
  end
end
