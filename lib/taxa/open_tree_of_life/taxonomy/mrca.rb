# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Taxonomy
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module Mrca
        def mrca(ott_ids)
          raise ArgumentError, 'ott_ids required' if ott_ids.nil?
          raise ArgumentError, 'ott_ids expected to be an array' unless ott_ids.is_a?(Array)

          url = 'https://api.opentreeoflife.org/v3/taxonomy/mrca'
          response = @http_client.post(url, JSON.generate({ ott_ids: ott_ids }), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
