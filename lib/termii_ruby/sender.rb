# frozen_string_literal: true

# Performs sender operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  #
  # @author Collins Ugwu
  # Sender Class for creating and fetching the sender ID
  #
  class Sender < TermiiRuby::Termii
    def initialize(api_key)
      super()
      @client = TermiiRuby::Client.new(api_key)
    end

    #
    # Create a Sender ID
    #
    # @param [String] sender_id Represents the ID of the sender which can be alphanumeric or numeric
    # @param [String] usecase A sample of the type of message sent.
    # @param [String] company Represents the name of the company with the sender ID.
    #
    # @return [JSON] JSON object
    #
    def create_sender(sender_id, usecase, company)
      data = {
        sender_id: sender_id,
        usecase: usecase,
        company: company
      }
      @client.make_post_request(CREATE_SENDER, data)
    end

    #
    # A Sender ID is the name or number that identifies the sender of an SMS message.
    #
    # @return [JSON] JSON object
    #
    def fetch_senders
      @client.make_get_request(FETCH_SENDER)
    end

    def verify; end
  end
end
