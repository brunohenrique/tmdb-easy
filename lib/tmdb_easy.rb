require 'rubygems'
require 'bundler'

Bundler.require

require 'net/http'
require 'uri'
require "rexml/document"

#Load files in the correct order, not in alphabetical natural order. :)
required_files = ['base.rb',
                  'auth.rb',
                  'media.rb',
                  'misc.rb',
                  'movie.rb',
                  'people.rb']

required_files.each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), 'tmdb_easy', file))
end

