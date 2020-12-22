# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module TNRS
    class MatchNamesTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/tnrs/match_names_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/tnrs/match_names') do |_env|
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
        result = @client.tnrs.match_names(names: ['foo'])
        assert_instance_of(Hash, result)
      end

      def test_failure_with_no_names
        assert_raises(ArgumentError) { @client.tnrs.match_names }
      end
    end
  end
end
