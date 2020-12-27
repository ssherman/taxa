# frozen_string_literal: true

require_relative './find_studies'
require_relative './find_trees'
require_relative './properties'
require_relative './study'
require_relative './tree'

module Taxa
  module OpenTreeOfLife
    # Studies api endpoints
    class Studies
      attr_reader :http_client

      include FindStudies
      include FindTrees
      include Properties
      include Study
      include Tree

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end
