# frozen_string_literal: true

module Taxa
  module EOLClassic
    # API client for Open Tree of Life
    class Client
      attr_accessor :options
      attr_reader :http_client

      def initialize(**options)
        @options = options

        @http_client = options[:http_client] || Faraday.new
      end

      def search(query, **parameters)
        raise ArgumentError, 'query can not be nil' if query.nil?

        url = 'https://eol.org/api/search/1.0.json'
        response = @http_client.get(url, { q: query }.merge(parameters), { 'Accept' => 'application/json' })
        parse_response(response)
      end

      def collections(id, **parameters)
        raise ArgumentError, 'id can not be nil' if id.nil?

        url = "https://eol.org/api/collections/1.0/#{id}.json"
        response = @http_client.get(url, parameters, { 'Accept' => 'application/json' })
        parse_response(response)
      end

      def pages(id, **parameters)
        raise ArgumentError, 'id can not be nil' if id.nil?

        url = "https://eol.org/api/pages/1.0/#{id}.json"
        response = @http_client.get(url, parameters, { 'Accept' => 'application/json' })
        parse_response(response)
      end

      def data_objects(id, **parameters)
        raise ArgumentError, 'id can not be nil' if id.nil?

        url = "https://eol.org/api/data_objects/1.0/#{id}.json"
        response = @http_client.get(url, parameters, { 'Accept' => 'application/json' })
        parse_response(response)
      end

      def hierarchy_entries(id, **parameters)
        raise ArgumentError, 'id can not be nil' if id.nil?

        url = "https://eol.org/api/hierarchy_entries/1.0/#{id}.json"
        response = @http_client.get(url, parameters, { 'Accept' => 'application/json' })
        parse_response(response)
      end

      private

      def parse_response(response)
        JSON.parse(response.body)
      rescue StandardError
        nil
      end
    end
  end
end
