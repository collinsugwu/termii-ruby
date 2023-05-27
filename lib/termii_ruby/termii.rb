# frozen_string_literal: true

# Base Class

require_relative "mixins/endpoints"

module TermiiRuby
  class Termii
    include TermiiRuby::Mixins::Endpoints
    attr_accessor :message_text, :pin_type, :channel, :pin_attempts, :pin_length, :pin_time_to_live, :pin_placeholder

    def initialize
      @message_type = "NUMERIC"
      @pin_type = "NUMERIC"
      @channel = "generic"
      @pin_attempts = 3
      @pin_length = 4
      @pin_time_to_live = 10
      @pin_placeholder = "< 1234 >"
      @country_code = "NG"
    end

    def verify
      raise NotImplementedError, "Subclasses must implement the verify method"
    end

    def update_attributes(attrs)
      attrs.each do |key, value|
        self[key.to_s] = value
      end
    end
  end
end
