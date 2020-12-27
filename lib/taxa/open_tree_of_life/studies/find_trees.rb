# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Studies
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module FindTrees
        def find_trees(**parameters)
          url = 'https://api.opentreeoflife.org/v3/studies/find_trees'
          response = @http_client.post(url, JSON.generate(parameters),
                                       'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
