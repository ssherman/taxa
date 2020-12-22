# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module TNRS
    class AutocompleteNameTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/tnrs/autocomplete_name_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/tnrs/autocomplete_name') do |_env|
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
        result = @client.tnrs.autocomplete_name(name: 'foo')
        assert_instance_of(Array, result)
      end

      def test_failure_with_no_name
        assert_raises(ArgumentError) { @client.tnrs.autocomplete_name }
      end
    end
  end
end
