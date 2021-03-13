# frozen_string_literal: true

require 'test_helper'

module PlantsOfTheWorldOnline
  class LookupTest < Minitest::Test
    def setup
      response = File.read('test/fixtures/plants_of_the_world_online/lookup_response.json')
      conn = Faraday.new do |builder|
        builder.adapter :test do |stub|
          # block returns an array with 3 items:
          # - Integer response status
          # - Hash HTTP headers
          # - String response body
          stub.get('/api/2/taxon/urn:lsid:ipni.org:names:273040-1') do |_env|
            [
              200,
              { 'Content-Type': 'application/json' },
              response
            ]
          end
        end
      end
      @client = Taxa::PlantsOfTheWorldOnline::Client.new(http_client: conn)
    end

    def test_success_with_include
      result = @client.lookup('urn:lsid:ipni.org:names:273040-1', %w[distribution descriptions])
      assert_instance_of(Hash, result)
    end

    def test_success_without_include
      result = @client.lookup('urn:lsid:ipni.org:names:273040-1')
      assert_instance_of(Hash, result)
    end

    def test_no_id
      assert_raises(ArgumentError) { @client.lookup(nil) }
    end
  end
end
