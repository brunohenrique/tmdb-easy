require_relative '../lib/tmdb_easy'

require 'rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
end
