# frozen_string_literal: true

require 'json'

module Taxa
  module OpenTreeOfLife
    class TreeOfLife
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module NodeInfo
        def node_info(**parameters)
          valid = parameters[:ott_id] || parameters[:node_id] || parameters[:node_ids]
          raise ArgumentError unless valid

          url = 'https://api.opentreeoflife.org/v3/tree_of_life/node_info'
          response = @http_client.post(url, JSON.generate(parameters), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
