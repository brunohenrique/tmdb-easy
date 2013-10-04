module TmdbEasy
  class Movie < TmdbEasy::Endpoint
    @@endpoint = endpoint

    def self.find id
      attributes = Base.fetch @@endpoint, resource: id
      new attributes
    end

    def self.search terms
      search_results = Search.fetch(terms, @@endpoint).results

      search_results.map do |result|
        find result['id']
      end
    end
  end
end
