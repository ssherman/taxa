# frozen_string_literal: true

require_relative './about'
require_relative './node_info'
require_relative './mrca'
require_relative './subtree'
require_relative './induced_subtree'
require_relative '../label_format_helper'

module Taxa
  module OpenTreeOfLife
    # wraps the tree of life API from Open Tree of Life
    class TreeOfLife
      include About
      include NodeInfo
      include Mrca
      include Subtree
      include InducedSubtree
      include LabelFormatHelper

      SUBTREE_FORMATS = %w[newick arguson].freeze

      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end
