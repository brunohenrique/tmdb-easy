module TmdbEasy
  class Search
    attr_reader :attributes

    def initialize attributes
      @attributes = attributes
    end

    def method_missing name, *args, &block
      @attributes.has_key?(name.to_s) ? @attributes[name.to_s] : super
    end

    def self.endpoint
      @@endpoint ||= name.split('::').last.downcase
    end

    def self.fetch terms, resource_type
      attributes = Base.fetch "#{endpoint}/#{resource_type}", query: terms
      new attributes
    end
  end
end
