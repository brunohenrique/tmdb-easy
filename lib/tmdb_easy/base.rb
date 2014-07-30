module TmdbEasy
  class Base
    include HTTParty

    base_uri 'http://api.themoviedb.org/3'
    format :json
    headers 'Accept' => 'application/json'

    def self.config
      @@config ||= {}
    end

    def self.api_key(api_key)
      config[:api_key] = api_key
    end

    def self.fetch(endpoint, options = {})
      resource = options.delete :resource
      params = config.merge(options)

      get "/#{mount_endpoint(endpoint, resource)}", query: params
    end

    private

    def self.mount_endpoint(endpoint, resource)
      resource = "/#{resource}" if resource

      "#{endpoint}#{resource}"
    end
  end
end
