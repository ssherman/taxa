# frozen_string_literal: true

require 'test_helper'

module EOLClassic
  class HierarchyEntriesTest < Minitest::Test
    def setup
      response = File.read('test/fixtures/eol_classic/hierarchy_entries_response.json')
      conn = Faraday.new do |builder|
        builder.adapter :test do |stub|
          # block returns an array with 3 items:
          # - Integer response status
          # - Hash HTTP headers
          # - String response body
          stub.get('/api/hierarchy_entries/1.0/7226994.json') do |_env|
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
      result = @client.hierarchy_entries(7_226_994)
      assert_instance_of(Hash, result)
    end

    def test_no_id
      assert_raises(ArgumentError) { @client.hierarchy_entries(nil) }
    end
  end
end
