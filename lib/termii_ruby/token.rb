# frozen_string_literal: true

# Performs token operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  #
  # @author Collins Ugwu
  # Token allows businesses generate, send and verify one-time-passwords.
  #
  class Token < TermiiRuby::Termii
    def initialize(api_key)
      super()
      @client = TermiiRuby::Client.new(api_key)
    end

    #
    # The send token API allows businesses trigger one-time-passwords (OTP) across any available messaging channel on Termii. One-time-passwords created are generated randomly and there's an option to set an expiry time.
    #
    # @param [string] to Represents the email address if the channel is set to email (Example: testshola@termii.com). It represents the destination phone number if other channels are selected. Phone number must be in the international format (Example: 23490126727)
    # @param [string] from Represents the configuration ID if the channel is set to email (Example: 0a53c416-uocj-95af-ab3c306aellc). It can be found on your Termii dashboard. If other channels are selected, it represents a sender ID which can be alphanumeric or numeric. Alphanumeric sender ID length should be between 3 and 11 characters (Example:CompanyName)
    # @param [string] message_text Text of a message that would be sent to the destination phone number
    #
    # @return [JSON] JSON object
    #
    def send_otp_token(to, from, message_text)
      data = {
        to: to,
        from: from,
        message_text: message_text,
        channel: @channel,
        message_type: @message_type,
        pin_attempts: @pin_attempts,
        pin_length: @pin_length,
        pin_placeholder: @pin_placeholder,
        pin_time_to_live: @pin_time_to_live,
        pin_type: @pin_type
      }
      @client.make_post_request(SEND_OTP_TOKEN, data)
    end

    #
    # The voice token API enables you to generate and trigger one-time passwords (OTP) through the voice channel to a phone number. OTPs are generated and sent to the phone number and can only be verified using our Verify Token API .
    #
    # @param [string] phone_number The destination phone number. Phone number must be in the international format (Example: 23490126727)
    #
    # @return [JSON] JSON object
    #
    def send_voice_token(phone_number)
      data = {
        phone_number: phone_number,
        pin_attempts: @pin_attempts,
        pin_length: @pin_length,
        pin_time_to_live: @pin_time_to_live
      }
      @client.make_post_request(SEND_VOICE_TOKEN, data)
    end

    #
    # The voice call API enables you to send messages from your application through our voice channel to a phone number. Only one-time-passwords (OTP) are allowed for now and these OTPs can not be verified using our Verify Token API.
    #
    # @param [String] phone_number The destination phone number. Phone number must be in the international format (Example: 23490126727)
    # @param [Numeric] code Example: 3344, The code you want your users to receive. It has to be numeric and length must be between 4 and 8 digits.
    #
    # @return [JSON] JSON object
    #
    def send_voice_call(phone_number, code)
      data = {
        phone_number: phone_number,
        code: code
      }

      @client.make_post_request(SEND_VOICE_CALL, data)
    end

    #
    # This API returns OTP codes in JSON format which can be used within any web or mobile app.
    #
    # @param [String] phone_number Represents the destination phone number.Phone number must be in the international format (Example: 23490126727)
    #
    # @return [JSON] JSON object
    #
    def send_in_app_token(phone_number)
      data = {
        phone_number: phone_number,
        pin_attempts: @pin_attempts,
        pin_time_to_live: @pin_time_to_live,
        pin_length: @pin_length,
        pin_type: @pin_type
      }
      @client.make_post_request(SEND_IN_APP_TOKEN, data)
    end

    #
    # Verify token API, checks tokens sent to customers and returns a response confirming the status of the token. A token can either be confirmed as verified or expired based on the timer set for the token.
    #
    # @param [string] pin_id ID of the PIN sent (Example: "c8dcd048-5e7f-4347-8c89-4470c3af0b")
    # @param [string] token The PIN code (Example: "195558")
    #
    # @return [JSON] JSON object
    #
    def verify(pin_id, token)
      data = {
        pin_id: pin_id,
        pin: token
      }
      @client.make_post_request(VERIFY_TOKEN, data)
    end
  end
end
