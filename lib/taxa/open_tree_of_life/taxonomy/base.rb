# frozen_string_literal: true

require_relative './about'
require_relative './taxon_info'
require_relative './mrca'
require_relative './subtree'
require_relative '../label_format_helper'

module Taxa
  module OpenTreeOfLife
    # Taxonomy api endpoints
    class Taxonomy
      include About
      include TaxonInfo
      include Mrca
      include Subtree
      include LabelFormatHelper

      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end
