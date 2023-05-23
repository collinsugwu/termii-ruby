# frozen_string_literal: true

# Performs token operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  class Token < TermiiRuby::Termii
    def initialize(api_key)
      super
      @client = TermiiRuby::Client.new(api_key)
    end

    def send_otp_token(to, from, message_text)
      data = {
        to: to,
        from: from,
        message_text: message_text,
        channel: @channel,
        message_type: @message_type,
        pin_attempts: @pin_attampts,
        pin_length: @pin_length,
        pin_placeholder: @pin_placeholder,
        pin_time_to_live: @pin_time_to_live,
        pin_type: @pin_type
      }
      @client.make_post_request(SEND_OTP_TOKEN, data)
    end

    def send_voice_token(phone_number)
      data = {
        phone_number: phone_number,
        pin_attampts: @pin_attempts,
        pin_length: @pin_length,
        pin_time_to_live: @pin_time_to_live
      }
      @client.make_post_request(SEND_VOICE_TOKEN, data)
    end

    def send_voice_call(phone_number, code)
      data = {
        phone_number: phone_number,
        code: code
      }

      @client.make_post_request(SEND_VOICE_CALL, data)
    end

    def send_in_app_token(phone_number)
      data = {
        phone_number: phone_number,
        pin_attampts: @pin_attempts,
        pin_time_to_live: @pin_time_to_live,
        pin_length: @pin_length
      }
      @client.make_post_request(SEND_IN_APP_TOKEN, data)
    end

    def verify(pin_id, pin)
      data = {
        pin_id: pin_id,
        pin: pin
      }
      @client.make_post_request(VERIFY_TOKEN, data)
    end
  end
end
