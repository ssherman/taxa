# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class TreeOfLife
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module Subtree
        def subtree(**parameters)
          ott_id = parameters[:ott_id]
          node_id = parameters[:node_id]

          validate_ott_and_node_id(ott_id, node_id)

          format = parameters[:format] || 'newick'
          validate_format(format)

          label_format = get_label_format(format, parameters)

          height_limit = get_height_limit(format, parameters)
          payload = { node_id: node_id, ott_id: ott_id, format: format, label_format: label_format,
                      height_limit: height_limit }.compact
          url = 'https://api.opentreeoflife.org/v3/tree_of_life/subtree'
          response = @http_client.post(url, JSON.generate(payload), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end

        private

        def validate_ott_and_node_id(ott_id, node_id)
          raise ArgumentError, 'ott_id or node_id are required' if ott_id.nil? && node_id.nil?
          raise ArgumentError, 'ott_id and node_id specified. Only 1 can be specified' if !ott_id.nil? && !node_id.nil?
        end

        def validate_format(format)
          return if SUBTREE_FORMATS.include?(format)

          raise ArgumentError, "format be one of the following #{SUBTREE_FORMATS.join(', ')}"
        end

        def get_height_limit(format, **parameters)
          height_limit = parameters[:height_limit]
          (format == 'arguson' ? 3 : -1) if height_limit.nil?
        end
      end
    end
  end
end
