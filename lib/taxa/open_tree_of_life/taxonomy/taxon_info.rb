# frozen_string_literal: true

require 'faraday'
require 'json'

module Taxa
  module OpenTreeOfLife
    class Taxonomy
      # wrapper around the node_info tree of life endpoint for Open Tree of Life
      module TaxonInfo
        def taxon_info(**parameters)
          ott_id = parameters[:ott_id]
          source_id = parameters[:source_id]
          validate_ott_and_source_id(ott_id, source_id)

          url = 'https://api.opentreeoflife.org/v3/taxonomy/taxon_info'
          response = @http_client.post(url, JSON.generate(parameters), 'Content-Type' => 'application/json')
          JSON.parse(response.body)
        end

        private

        def validate_ott_and_source_id(ott_id, source_id)
          raise ArgumentError, 'ott_id or source_id are required' if ott_id.nil? && source_id.nil?
          raise ArgumentError, 'ott_id and source_id specified. Only 1 can be used' if !ott_id.nil? && !source_id.nil?
        end
      end
    end
  end
end
