module TmdbEasy
  class Base
    attr_accessor :api_key, :format_response, :language_default

    @@api_url = "http://api.themoviedb.org/2.1/"
  end
end