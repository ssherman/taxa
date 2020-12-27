# frozen_string_literal: true

require 'test_helper'

module OpenTreeOfLife
  module Studies
    class StudyTest < Minitest::Test
      def setup
        response = File.read('test/fixtures/open_tree_of_life/studies/tree_response.json')
        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            # block returns an array with 3 items:
            # - Integer response status
            # - Hash HTTP headers
            # - String response body
            stub.get('/v3/study/pg_1629/tree/tree3287') do |_env|
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
        result = @client.studies.tree('pg_1629', 'tree3287')
        assert_instance_of(Hash, result)
      end
    end
  end
end
