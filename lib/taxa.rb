# frozen_string_literal: true

require 'taxa/version'
require_relative './taxa/open_tree_of_life/base'

module Taxa
  include OpenTreeOfLife
  class Error < StandardError; end
  # Your code goes here...
end
