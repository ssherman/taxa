# frozen_string_literal: true

require_relative './about'
require_relative './node_info'
require_relative './mrca'
require_relative './subtree'
require_relative './induced_subtree'

module Taxa
  module OpenTreeOfLife
    # wraps the tree of life API from Open Tree of Life
    class TreeOfLife
      include About
      include NodeInfo
      include Mrca
      include Subtree
      include InducedSubtree

      SUBTREE_FORMATS = %w[newick arguson].freeze
      SUBTREE_LABEL_FORMATS = %w[name id name_and_id].freeze

      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end

      def get_label_format(format, **parameters)
        if format == 'newick'
          label_format = parameters[:label_format] || 'name_and_id'
          unless SUBTREE_LABEL_FORMATS.include?(label_format)
            raise ArgumentError, "label_format be one of the following #{SUBTREE_LABEL_FORMATS.join(', ')}"
          end
        end
        nil
      end
    end
  end
end
