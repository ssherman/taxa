# frozen_string_literal: true

require 'test_helper'

module PlantsOfTheWorldOnline
  class SearchTest < Minitest::Test
    def setup
      response = File.read('test/fixtures/plants_of_the_world_online/search_response.json')
      conn = Faraday.new do |builder|
        builder.adapter :test do |stub|
          # block returns an array with 3 items:
          # - Integer response status
          # - Hash HTTP headers
          # - String response body
          stub.get('/api/2/search') do |_env|
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

    def test_success
      result = @client.search('test')
      assert_instance_of(Hash, result)
    end

    def test_success_with_filters
      result = @client.search('test', filters: %w[has_images species_f])
      assert_instance_of(Hash, result)
    end

    def test_success_with_filters_as_a_string
      result = @client.search('test', filters: 'has_images')
      assert_instance_of(Hash, result)
    end

    def test_success_with_filters_and_page
      result = @client.search('test', filters: 'has_images', page: 1)
      assert_instance_of(Hash, result)
    end

    def test_no_q
      assert_raises(ArgumentError) { @client.search(nil) }
    end
  end
end
