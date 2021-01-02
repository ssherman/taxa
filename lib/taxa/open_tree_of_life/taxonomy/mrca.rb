# frozen_string_literal: true

require 'json'

module Taxa
  module OpenTreeOfLife
    class Taxonomy
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module Mrca
        def mrca(ott_ids)
          raise ArgumentError, 'ott_ids required' if ott_ids.nil?

          url = 'https://api.opentreeoflife.org/v3/taxonomy/mrca'
          response = @http_client.post(url, JSON.generate({ ott_ids: Array(ott_ids) }),
                                       'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
