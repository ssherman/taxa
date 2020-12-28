# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module Taxonomy
    class MrcaTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/taxonomy/mrca_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/taxonomy/mrca') do |_env|
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
        result = @client.taxonomy.mrca(['sdsds'])
        assert_instance_of(Hash, result)
      end

      def test_nil
        assert_raises(ArgumentError) { @client.taxonomy.mrca(nil) }
      end
    end
  end
end
