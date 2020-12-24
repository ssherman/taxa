# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Taxonomy
      # tree of life about api endpoint
      module About
        def about
          response = @http_client.post('https://api.opentreeoflife.org/v3/taxonomy/about')
          JSON.parse(response.body)
        end
      end
    end
  end
end
