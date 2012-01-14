module TmdbEasy  
  class Movie < Base
    def movie_search(keyword, lang = "en", response = "json")
      method_request = @@api_url + "Movie.search/#{lang}/#{response}/#{self.api_key}/#{keyword}"

      uri = URI.parse(method_request)
      response = Net::HTTP.get_response(uri).body
      @json_response = response.to_json
    end
  end
end