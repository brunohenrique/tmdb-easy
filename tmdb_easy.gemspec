# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tmdb_easy/version"

Gem::Specification.new do |s|
  s.name        = "tmdb_easy"
  s.version     = TmdbEasy::VERSION
  s.date        = %q{2011-11-28}
  s.authors     = ["Bruno Henrique - Garu"]
  s.email       = ["squall.bruno@gmail.com"]
  s.homepage    = "https://github.com/brunohenrique/tmdb_easy"
  s.summary     = %q{TMDB API made easy}
  s.description = %q{Ruby bindings to TMDB API}

  s.rubyforge_project = %q{tmdb_easy}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rake')
end
