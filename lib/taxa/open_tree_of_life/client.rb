# frozen_string_literal: true

require_relative './tnrs/base'
require_relative './tree_of_life/base'
require_relative './taxonomy/base'
require_relative './studies/base'
require 'faraday'

module Taxa
  module OpenTreeOfLife
    # API client for Open Tree of Life
    class Client
      attr_accessor :options
      attr_reader :tnrs, :tree_of_life, :taxonomy, :studies

      def initialize(**options)
        @options = options

        http_client = options[:http_client] || Faraday.new
        @tnrs = TNRS.new(http_client)
        @tree_of_life = TreeOfLife.new(http_client)
        @taxonomy = Taxonomy.new(http_client)
        @studies = Studies.new(http_client)
      end
    end
  end
end
