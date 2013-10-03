lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tmdb_easy/version'

Gem::Specification.new do |s|
  s.name = 'tmdb-easy'
  s.version = TmdbEasy::VERSION
  s.date = Time.new.strftime('%Y-%m-%d')
  s.authors = ['Bruno Henrique - Garu']
  s.email = ['squall.bruno@gmail.com']
  s.homepage = 'https://github.com/brunohenrique/tmdb-easy'
  s.summary = %q{TMDB API made easy}
  s.description = %q{Use tmdb API easily}

  s.rubyforge_project = %q{tmdb_easy}

  s.license = 'MIT'

  s.files = `git ls-files`.split($/)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'

  s.add_runtime_dependency 'json'
end
