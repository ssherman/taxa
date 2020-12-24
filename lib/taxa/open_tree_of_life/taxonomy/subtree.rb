# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Taxonomy
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module Subtree
        def subtree(**parameters)
          ott_id = parameters[:ott_id]
          raise ArgumentError, 'ott_id required' if ott_id.nil?

          label_format = get_label_format('newick', **parameters)

          url = 'https://api.opentreeoflife.org/v3/taxonomy/subtree'
          response = @http_client.post(url, JSON.generate({ ott_id: ott_id, label_format: label_format }),
                                       'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
