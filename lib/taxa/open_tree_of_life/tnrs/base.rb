# frozen_string_literal: true

require_relative './match_names'
require_relative './autocomplete_name'
require_relative './contexts'
require_relative './infer_context'

module Taxa
  module OpenTreeOfLife
    # TNRS api endpoints
    class TNRS
      include MatchNames
      include AutocompleteName
      include Contexts
      include InferContext

      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end
    end
  end
end
