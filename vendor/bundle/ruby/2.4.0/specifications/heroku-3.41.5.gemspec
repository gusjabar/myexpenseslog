# -*- encoding: utf-8 -*-
# stub: heroku 3.41.5 ruby lib

Gem::Specification.new do |s|
  s.name = "heroku".freeze
  s.version = "3.41.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Heroku".freeze]
  s.date = "2015-08-31"
  s.description = "Client library and command-line tool to deploy and manage apps on Heroku.".freeze
  s.email = "support@heroku.com".freeze
  s.executables = ["heroku".freeze]
  s.files = ["bin/heroku".freeze]
  s.homepage = "http://heroku.com/".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = " !    The `heroku` gem has been deprecated and replaced with the Heroku Toolbelt.\n !    Download and install from: https://toolbelt.heroku.com\n !    For API access, see: https://github.com/heroku/heroku.rb\n".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Client library and CLI to deploy apps on Heroku.".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<heroku-api>.freeze, [">= 0.3.19"])
      s.add_runtime_dependency(%q<launchy>.freeze, [">= 0.3.2"])
      s.add_runtime_dependency(%q<netrc>.freeze, [">= 0.10.0"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 1.6.0"])
      s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 0.9.9"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 1.10"])
      s.add_runtime_dependency(%q<net-ssh-gateway>.freeze, [">= 1.2.0"])
    else
      s.add_dependency(%q<heroku-api>.freeze, [">= 0.3.19"])
      s.add_dependency(%q<launchy>.freeze, [">= 0.3.2"])
      s.add_dependency(%q<netrc>.freeze, [">= 0.10.0"])
      s.add_dependency(%q<rest-client>.freeze, [">= 1.6.0"])
      s.add_dependency(%q<rubyzip>.freeze, [">= 0.9.9"])
      s.add_dependency(%q<multi_json>.freeze, [">= 1.10"])
      s.add_dependency(%q<net-ssh-gateway>.freeze, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<heroku-api>.freeze, [">= 0.3.19"])
    s.add_dependency(%q<launchy>.freeze, [">= 0.3.2"])
    s.add_dependency(%q<netrc>.freeze, [">= 0.10.0"])
    s.add_dependency(%q<rest-client>.freeze, [">= 1.6.0"])
    s.add_dependency(%q<rubyzip>.freeze, [">= 0.9.9"])
    s.add_dependency(%q<multi_json>.freeze, [">= 1.10"])
    s.add_dependency(%q<net-ssh-gateway>.freeze, [">= 1.2.0"])
  end
end
