# frozen_string_literal: true

require 'json'

module Taxa
  module OpenTreeOfLife
    class TreeOfLife
      # tree of life about api endpoint
      module About
        def about
          response = @http_client.post('https://api.opentreeoflife.org/v3/tree_of_life/about')
          JSON.parse(response.body)
        end
      end
    end
  end
end
