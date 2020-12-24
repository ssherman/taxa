# frozen_string_literal: true

require_relative './about'
require_relative './taxon_info'

module Taxa
  module OpenTreeOfLife
    # Taxonomy api endpoints
    class Taxonomy
      include About
      include TaxonInfo

      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end
