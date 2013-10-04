require_relative '../lib/tmdb_easy'

require 'rspec'
require 'vcr'

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/fixtures/cassettes'
end

def tmdb_api_key
  '50abc7aa03af3809839b4a09deb279c8'
end


