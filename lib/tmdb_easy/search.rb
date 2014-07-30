module TmdbEasy
  class Search < Endpoint
    @@endpoint = endpoint

    def self.fetch(terms, resource_type)
      attributes = Base.fetch "#{@@endpoint}/#{resource_type}", query: terms
      new attributes
    end
  end
end
