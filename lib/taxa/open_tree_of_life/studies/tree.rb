# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Studies
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module Tree
        def tree(study_id, tree_id)
          url = "https://api.opentreeoflife.org/v3/study/#{study_id}/tree/#{tree_id}"
          response = @http_client.get(url, nil, 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
