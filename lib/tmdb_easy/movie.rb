module TmdbEasy
  class Movie
    @@endpoint = 'movie'

    attr_accessor :attributes

    def initialize attributes
      @attributes = attributes
    end

    def method_missing name, *args, &block
      if @attributes.has_key? name.to_s
        @attributes[name.to_s]
      else
        super
      end
    end

    def self.endpoint
      @@endpoint
    end

    def self.find id
      attributes = Base.fetch id, @@endpoint
      new attributes
    end
  end
end
