# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class TNRS
      # tnrs contexts api endpoint
      module Contexts
        def contexts
          url = 'https://api.opentreeoflife.org/v3/tnrs/contexts'
          response = @http_client.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
