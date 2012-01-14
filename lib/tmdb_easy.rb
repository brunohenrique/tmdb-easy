require 'net/http'
require 'uri'
require 'json'

require_files = []
require_files.concat Dir[File.join(File.dirname(__FILE__), 'tmdb_easy', '*.rb')]

require_files.each do |file|
  require File.expand_path(file)
end
