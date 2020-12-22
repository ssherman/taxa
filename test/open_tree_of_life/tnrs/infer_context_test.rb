# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module TNRS
    class InferContextTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/tnrs/infer_context_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/tnrs/infer_context') do |_env|
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

      def test_success
        result = @client.tnrs.infer_context(names: ['foo'])
        assert_instance_of(Hash, result)
      end

      def test_failure_with_no_name
        assert_raises(ArgumentError) { @client.tnrs.infer_context }
      end
    end
  end
end
