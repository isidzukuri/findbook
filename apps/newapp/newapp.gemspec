$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "newapp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "newapp"
  s.version     = Newapp::VERSION
  s.authors     = ["Isidzukuri"]
  s.email       = ["axesigon@gmail.com"]
  s.homepage    = "https://github.com/isidzukuri/lib_agregator"
  s.summary     = "Newapp"
  s.description = "Newapp"
  s.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 6.0.0"
  s.add_dependency 'mysql2'

  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails', '~> 4.0.0.beta2'
end
