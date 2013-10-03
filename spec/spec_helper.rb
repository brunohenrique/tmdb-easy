require_relative '../lib/tmdb_easy'

require 'rspec'
require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/fixtures/cassettes'
end

def api_key
  '50abc7aa03af3809839b4a09deb279c8'
end
