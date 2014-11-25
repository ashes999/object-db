Gem::Specification.new do |s|
	s.name			= 'object-db'
	s.version		= '0.0.1'
	s.date			= '2014-11-24'
	s.summary		= 'Embeddable object database'
	s.description	= 'An embeddable, pure-ruby object (NoSQL) database.'
	s.authors		= ['Ashiq A.']
	s.email			= 'alibhai.ashiq@gmail.com'
	s.homepage	= 'https://github.com/ashes999/object-db'
	s.files			= Dir["{lib}/**/*.rb", "*.rb", "*.md"]
	s.license   = 'MIT'
	s.add_runtime_dependency 'json', '~> 1.5.5'
end
