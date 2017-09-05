module Hyrax
  module CollectionNesting
    extend ActiveSupport::Concern

    included do
      after_save :update_relationship_index
      def update_relationship_index
        Samvera::NestingIndexer.reindex_relationships(id: id)
      end
    end
  end
end
