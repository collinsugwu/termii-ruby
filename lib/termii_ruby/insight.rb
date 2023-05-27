# frozen_string_literal: true

# Performs insight operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  # @author Collins Ugwu
  # Retrieve real-time delivery report of messages sent to customers as well as the status of their contacts
  #
  class Insight < TermiiRuby::Termii
    QUERY = "phone_number"

    def initialize(api_key)
      super()
      @client = TermiiRuby::Client.new(api_key)
    end

    def verify; end

    #
    # The Balance API returns your total balance and balance information from your wallet, such as currency.
    #
    # @return [JSON] JSON object
    #
    def balance
      @client.make_get_request(GET_BALANCE)
    end

    #
    # The search API allows businesses verify phone numbers and automatically detect their status as well as current network
    #
    # @param [String] phone_number Represents the phone number to be verified. Phone number must be in the international format (Example: 23490126727)
    # @param [Hash] query Hash of the query params
    #
    # @return [JSON] JSON object
    #
    def search(phone_number, query = {})
      if query.empty?
        query = {
          phone_number: phone_number
        }
      end

      @client.make_get_request(SEARCH, query)
    end

    #
    # <Description>
    #
    # @param [<Type>] phone_number Represents the phone number to be verified. Phone number must be in the international format (Example: 2348753243651)
    # @param [Hash] query Hash of the query params
    #
    # @return [JSON] JSON object
    #
    def status(phone_number, query = {})
      if query.empty?
        query = {
          phone_number: phone_number,
          country_code: @country_code
        }
      end
      @client.make_get_request(STATUS, query)
    end

    #
    # This Inbox API returns reports for messages sent across the sms, voice & whatsapp channels. Reports can either display all messages on termii or a single message.
    #
    # @return [JSON] JSON object
    #
    def history
      @client.make_get_request(HISTORY)
    end
  end
end
