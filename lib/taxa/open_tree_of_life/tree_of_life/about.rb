# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  class OpenTreeOfLife
    class TreeOfLife
      # tree of life about api endpoint
      module About
        def about
          http_request 'https://api.opentreeoflife.org/v3/tree_of_life/about'
        end
      end
    end
  end
end
