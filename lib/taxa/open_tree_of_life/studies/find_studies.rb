# frozen_string_literal: true

require 'json'

module Taxa
  module OpenTreeOfLife
    class Studies
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module FindStudies
        def find_studies(**parameters)
          url = 'https://api.opentreeoflife.org/v3/studies/find_studies'
          response = @http_client.post(url, JSON.generate(parameters),
                                       'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end
      end
    end
  end
end
