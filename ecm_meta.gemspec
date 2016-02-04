$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ecm/meta/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_meta'
  s.version     = Ecm::Meta::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_meta'
  s.summary     = 'Ecm::Meta.'
  s.description = 'Ecm Meta Package.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails'

  s.add_dependency 'ecm_cms2'
  s.add_dependency 'ecm_contact2'
  s.add_dependency 'ecm_downloads2'
  s.add_dependency 'ecm_lightbox2'
  s.add_dependency 'ecm_links2'
  s.add_dependency 'ecm_news2'
  s.add_dependency 'ecm_pictures2'
  s.add_dependency 'ecm_references2'
  s.add_dependency 'ecm_user_area2'
  s.add_dependency 'ecm_youtube'

  s.add_dependency 'ecm_cms2_backend'
  s.add_dependency 'ecm_downloads2_backend'
  s.add_dependency 'ecm_links2_backend'
  s.add_dependency 'ecm_news2_backend'
  s.add_dependency 'ecm_pictures2_backend'
  s.add_dependency 'ecm_references2_backend'
  s.add_dependency 'ecm_user_area2_backend'
  s.add_dependency 'ecm_youtube_backend'
end
