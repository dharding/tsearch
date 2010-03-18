spec = Gem::Specification.new do |s|
  s.name = 'tsearch'
  s.version = '1.0.0'
  s.summary = "Provides easy access to PostgreSQL's tsearch full text search for your ActiveRecord models"
  s.description = %{Provides easy access to PostgreSQL's tsearch full text search for your ActiveRecord models using named scopes}
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb'] + Dir['lib/**/*.treetop']
  s.require_path = 'lib'
  s.autorequire = 'texticle'
  s.has_rdoc = false
  s.author = "David Harding"
  s.email = "david@metalogik.com"
  s.homepage = "http://github.com/dharding/texticle"
  s.rubyforge_project = %{tsearch}
end
