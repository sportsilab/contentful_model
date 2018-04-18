module ContentfulModel
  class Query
    attr_accessor :parameters
    def initialize(referenced_class, parameters=nil)
      @parameters = parameters || {}
      @referenced_class = referenced_class
    end

    def <<(parameters)
      @parameters.merge!(parameters)
    end

    def default_parameters
      { 'content_type' => @referenced_class.send(:content_type_id) }
    end

    def execute
      query = @parameters.merge(default_parameters)
      result = client.send(:entries,query)
      return result.to_a.reject {|entity| entity.is_a?(Contentful::Link) || entity.invalid?}
    end

    def client
      @client ||= @referenced_class.send(:client)
    end

    def reset
      @parameters = default_parameters
    end

    def paginate(page = 1, per_page = 100, order_field = 'sys.updatedAt')
      page = 1 if page.nil? || !page.is_a?(Numeric) || page <= 0
      per_page = 100 if per_page.nil? || !per_page.is_a?(Numeric) || per_page <= 0

      skip_records_count = (page - 1) * per_page
      query = @parameters.merge(default_parameters).
                          merge({ 'limit' => per_page, 'skip' => skip_records_count, 'order' => order_field })
      return client.send(:entries, query)
    end
  end
end
