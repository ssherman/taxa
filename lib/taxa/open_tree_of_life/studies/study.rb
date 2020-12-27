# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Studies
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module Study
        def study(id)
          url = "https://api.opentreeoflife.org/v3/study/#{id}"
          response = @http_client.get(url, nil, 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
