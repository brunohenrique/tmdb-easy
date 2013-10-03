module TmdbEasy
  class Base
    include HTTParty

    base_uri 'http://api.themoviedb.org/3'
    format :json
    headers 'Accept' => 'application/json'

    def self.config
      @@config ||= {}
    end

    def self.api_key api_key
      self.config[:api_key] = api_key
    end

    def self.fetch resource, endpoint
      get "/#{endpoint}/#{resource}", query: config
    end
  end
end
