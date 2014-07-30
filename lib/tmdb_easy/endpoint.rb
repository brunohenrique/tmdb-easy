module TmdbEasy
  class Endpoint
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name, *args, &block)
      @attributes.key?(name.to_s) ? @attributes[name.to_s] : super
    end

    def self.endpoint
      name.split('::').last.downcase
    end
  end
end
