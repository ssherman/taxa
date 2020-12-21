# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class TNRS
      # tnrs contexts api endpoint
      module InferContext
        def infer_context(**parameters)
          names = parameters[:names]
          raise ArgumentError if names.nil?

          payload = { names: names }
          url = 'https://api.opentreeoflife.org/v3/tnrs/infer_context'
          response = @http_client.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
