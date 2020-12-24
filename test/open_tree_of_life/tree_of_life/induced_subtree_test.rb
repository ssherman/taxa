# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module TreeOfLife
    class InducedSubtreeTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/tree_of_life/induced_subtree_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/tree_of_life/induced_subtree') do |_env|
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

      def test_success_with_node_ids
        result = @client.tree_of_life.induced_subtree(node_ids: ['ott81461'])
        assert_instance_of(Hash, result)
      end

      def test_success_with_ott_id
        result = @client.tree_of_life.induced_subtree(ott_ids: ['ott81461'])
        assert_instance_of(Hash, result)
      end

      def test_failure_with_no_ott_id_and_node_id
        assert_raises(ArgumentError) { @client.tree_of_life.induced_subtree }
      end
    end
  end
end
