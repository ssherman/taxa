# frozen_string_literal: true

require_relative './about'
require_relative './node_info'

module Taxa
  module OpenTreeOfLife
    # wraps the tree of life API from Open Tree of Life
    class TreeOfLife
      include About
      include NodeInfo

      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end
