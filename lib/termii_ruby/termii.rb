# frozen_string_literal: true

# Base Class

require_relative "mixins/endpoints"

#
# <Description>
#
module TermiiRuby
  class Termii
    include TermiiRuby::Mixins::Endpoints

    # @return [<Type>] <description>
    attr_accessor :message_text

    # @return [<Type>] <description>
    attr_accessor :pin_type

    # @return [<Type>] <description>
    attr_accessor :channel

    # @return [<Type>] <description>
    attr_accessor :pin_attempts

    # @return [<Type>] <description>
    attr_accessor :pin_length

    # @return [<Type>] <description>
    attr_accessor :pin_time_to_live

    # @return [<Type>] <description>
    attr_accessor :pin_placeholder

    #
    # <Description>
    #
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

    #
    # <Description>
    #
    # @return [<Type>] <description>
    #
    def verify
      raise NotImplementedError, "Subclasses must implement the verify method"
    end

    #
    # <Description>
    #
    # @param [<Type>] attrs <description>
    #
    # @return [<Type>] <description>
    #
    def update_attributes(attrs)
      attrs.each do |key, value|
        self[key.to_s] = value
      end
    end
  end
end
