module ContentfulModel
  module Queries
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def inherited(subclass)
        instantiate_query(subclass)
      end

      def instantiate_query(klass)
        klass.instance_variable_set(:"@query", ContentfulModel::Query.new(klass))
      end

      def load
        old_query = @query.dup
        @query.reset
        return old_query.execute
      end

      def find(id)
        @query << {'sys.id' => id}
        load.first
      end

      def paginate(page = 1, per_page = 100, order_field = 'sys.updatedAt')
        @query.paginate(page, per_page, order_field)
      end
    end
  end
end
