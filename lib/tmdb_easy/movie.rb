module TmdbEasy
  class Movie
    @@endpoint = 'movie'

    def self.endpoint
      @@endpoint
    end

    def self.find id
      Base.fetch id, @@endpoint
    end
  end
end
