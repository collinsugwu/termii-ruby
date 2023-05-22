# frozen_string_literal: true

# Performs insight operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  class Insight < TermiiRuby::Termii
    def initialize(api_key)
      @client = TermiiRuby::Client.new(api_key)
    end

    def verify; end
  end
end
