# frozen_string_literal: true

require 'test_helper'

module EOLClassic
  class DataObjectsTest < Minitest::Test
    def setup
      response = File.read('test/fixtures/eol_classic/data_objects_response.json')
      conn = Faraday.new do |builder|
        builder.adapter :test do |stub|
          # block returns an array with 3 items:
          # - Integer response status
          # - Hash HTTP headers
          # - String response body
          stub.get('/api/data_objects/1.0/8105579.json') do |_env|
            [
              200,
              { 'Content-Type': 'application/json' },
              response
            ]
          end
        end
      end
      @client = Taxa::EOLClassic::Client.new(http_client: conn)
    end

    def test_success
      result = @client.data_objects(8_105_579)
      assert_instance_of(Hash, result)
    end

    def test_no_id
      assert_raises(ArgumentError) { @client.data_objects(nil) }
    end
  end
end
