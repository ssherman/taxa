# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module Studies
    class PropertiesTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/studies/properties_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.post('/v3/studies/properties') do |_env|
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
        result = @client.studies.properties
        assert_instance_of(Hash, result)
      end
    end
  end
end
