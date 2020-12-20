# frozen_string_literal: true

require_relative './about'
require_relative './node_info'

module Taxa
  class OpenTreeOfLife
    # wraps the tree of life API from Open Tree of Life
    class TreeOfLife
      extend About
      extend NodeInfo

      def self.http_request(url)
        response = Faraday.post url
        JSON.parse(response.body)
      end
    end
  end
end
