$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'contentful_model/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "contentful_model"
  s.version     = ContentfulModel::VERSION
  s.authors     = ["Error Creative Studio"]
  s.email       = ["hosting@errorstudio.co.uk"]
  s.homepage    = "https://github.com/errorstudio/contentful_model"
  s.summary     = "A thin wrapper for Contentful gem"
  s.description = "A wrapper around the Contentful gem to give you a base class to inherit your models from"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'contentful', '~> 1.1'
  s.add_dependency 'contentful-management', '~> 1.4'
  s.add_dependency 'redcarpet', '~> 3.4', '>= 3.4.0'
  s.add_dependency 'activesupport', '~> 5.0', '>= 5.0.0'
  s.add_dependency 'public_suffix', '>= 2.0.2', '< 3.0'
  s.add_dependency 'require_all', '~> 1.5'

  s.add_development_dependency 'vcr', '~> 4.0', '>= 4.0.0'
  s.add_development_dependency 'rspec', '~> 3.7', '>= 3.7.0'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'guard', '~> 2.14', '>= 2.14.2'
  s.add_development_dependency 'guard-rspec', '~> 4.7', '>= 4.7.3'
  s.add_development_dependency 'webmock', '~> 3.3', '>= 3.3.0'
end
