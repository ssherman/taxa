# frozen_string_literal: true

require 'test_helper'

module EOLClassic
  class SearchTest < Minitest::Test
    def setup
      response = File.read('test/fixtures/eol_classic/search_response.json')
      conn = Faraday.new do |builder|
        builder.adapter :test do |stub|
          # block returns an array with 3 items:
          # - Integer response status
          # - Hash HTTP headers
          # - String response body
          stub.get('/api/search/1.0.json') do |_env|
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
      result = @client.search('test')
      assert_instance_of(Hash, result)
    end

    def test_no_q
      assert_raises(ArgumentError) { @client.search(nil) }
    end
  end
end
