# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module Taxonomy
    class TaxonInfoTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/taxonomy/taxon_info_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/taxonomy/taxon_info') do |_env|
              [
                200,
                { 'Content-Type': 'application/json' },
                response
              ]
            end
          end
        end
        @client = Taxa::OpenTreeOfLife::Client.new(http_client: conn)
      end

      def test_success_with_ott_id
        result = @client.taxonomy.taxon_info(ott_id: 'ott81461')
        assert_instance_of(Hash, result)
      end

      def test_success_with_source_id
        result = @client.taxonomy.taxon_info(source_id: 'ott81461')
        assert_instance_of(Hash, result)
      end

      def test_failure_with_ott_id_and_node_id
        assert_raises(ArgumentError) { @client.taxonomy.taxon_info(ott_id: 'asdsadas', source_id: 'asdsadas') }
      end
    end
  end
end
