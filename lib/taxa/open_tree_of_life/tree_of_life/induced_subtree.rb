# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class TreeOfLife
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module InducedSubtree
        def induced_subtree(**parameters)
          ott_ids = parameters[:ott_ids]
          node_ids = parameters[:node_ids]

          validate_ott_and_node_ids(ott_ids, node_ids)

          label_format = get_label_format('newick', **parameters)

          payload = { node_ids: node_ids, ott_ids: ott_ids, label_format: label_format }.compact
          url = 'https://api.opentreeoflife.org/v3/tree_of_life/induced_subtree'
          response = @http_client.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end

        private

        def validate_ott_and_node_ids(ott_ids, node_ids)
          raise ArgumentError, 'ott_ids or node_ids are required' if ott_ids.nil? && node_ids.nil?
        end
      end
    end
  end
end
