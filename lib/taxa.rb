# frozen_string_literal: true

require 'taxa/version'
require 'faraday'
require_relative './taxa/open_tree_of_life/client'
require_relative './taxa/eol_classic/client'

module Taxa
  # include OpenTreeOfLife
  class Error < StandardError; end
  # Your code goes here...
end
