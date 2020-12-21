# frozen_string_literal: true

require_relative './tnrs/base'
require_relative './tree_of_life/base'

module Taxa
  module OpenTreeOfLife
    # API client for Open Tree of Life
    class Client
      attr_accessor :options
      attr_reader :tnrs, :tree_of_life

      def initialize(**options)
        @options = options
        @tnrs = TNRS.new
        @tree_of_life = TreeOfLife.new
      end
    end
  end
end
