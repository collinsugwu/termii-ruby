# frozen_string_literal: true

require_relative "mixins/endpoints"

#
# @author Collins Ugwu
# Base Termii Class
#
module TermiiRuby
  class Termii
    include TermiiRuby::Mixins::Endpoints
    
    # @return [Stiring] Enum: "NUMERIC" "ALPHANUMERIC" Type of message that will be generated and sent as part of the OTP message. You can set message type to numeric or alphanumeric
    attr_accessor :message_type
    
    # @return [String] "NUMERIC"
    attr_accessor :pin_type

    # @return [<String>] This is the route through which the message is sent. It is either dnd, WhatsApp, or generic or email
    attr_accessor :channel

    # @return [Integer] Example: 3 Represents the number of times the PIN can be attempted before expiration. It has a minimum of one attempt
    attr_accessor :pin_attempts

    # @return [Integer] The length of the PIN code.It has a minimum of 4 and maximum of 8.
    attr_accessor :pin_length

    # @return [Interger] Represents how long the PIN is valid before expiration. The time is in minutes. The minimum time value is 0 and the maximum time value is 60
    attr_accessor :pin_time_to_live

    # @return [<Type>] Example: "< 1234 >" PIN placeholder. Right before sending the message, PIN code placeholder will be replaced with generate PIN code.
    attr_accessor :pin_placeholder
  
    # @return [String] <description>
    attr_accessor :country_code

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
    # Subclasses must implement the verify method
    #
    # @return [Object] NotImplementedError
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
