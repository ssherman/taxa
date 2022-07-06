# frozen_string_literal: true

require_relative '../utils'

module Taxa
  module PlantsOfTheWorldOnline
    # API client for Open Tree of Life
    class Client
      attr_accessor :options
      attr_reader :http_client

      POWO_URL = 'https://powo.science.kew.org/api/2'

      FILTERS = %w[accepted_names has_images families_f genus_f species_f infraspecific_f].freeze

      def initialize(**options)
        @options = options
        @http_client = options[:http_client] || Faraday.new
      end

      def search(query, options = {})
        options.transform_keys!(&:to_sym)

        page = options[:page] || 0
        per_page = options[:per_page] || 500

        filters = Array.wrap(options[:filters])
        validate_search_parameters(query, page, per_page, filters)

        payload = { q: query, p: page, perPage: per_page }
        payload.merge!({ f: filters.join(',') }) unless filters.empty?
        response = @http_client.get("#{POWO_URL}/search", payload, { 'Accept' => 'application/json' })
        parse_response(response)
      end

      def lookup(id, include = nil)
        raise ArgumentError, 'id can not be nil' if id.nil?

        include = Array.wrap(include)
        payload = {}
        payload.merge!({ fields: include.join(',') }) unless include.empty?
        response = @http_client.get("#{POWO_URL}/taxon/#{id}", payload, { 'Accept' => 'application/json' })
        parse_response(response)
      end

      private

      def validate_search_parameters(query, page, per_page, filters)
        raise ArgumentError, 'query can not be nil' if query.nil?

        if !filters.empty? && !filters.all? { |f| FILTERS.include? f }
          raise ArgumentError,
                "filter is invalid. It must be one of these: #{FILTERS.join(', ')} can not be nil"
        end

        raise ArgumentError, 'page must be an integer' unless page.is_a?(Integer)

        raise ArgumentError, 'per_page must be an integer' unless per_page.is_a?(Integer)

      end

      def parse_response(response)
        JSON.parse(response.body)
      rescue StandardError
        nil
      end
    end
  end
end
