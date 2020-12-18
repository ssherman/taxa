# frozen_string_literal: true
require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    module About
      def about
        response = Faraday.post 'https://api.opentreeoflife.org/v3/tree_of_life/about'
        JSON.parse(response.body)
      end
    end
  end
end
