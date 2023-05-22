# frozen_string_literal: true

# Performs sender operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  class Sender < TermiiRuby::Termii
    def initialize(api_key)
      @client = TermiiRuby::Client.new(api_key)
    end

    def create_sender(sender_id, usecase, company)
      data = {
        sender_id: sender_id,
        usecase: usecase,
        company: company
      }
      @client.make_post_request(CREATE_SENDER, data)
    end

    def fetch_senders
      @client.make_get_request(FETCH_SENDER)
    end

    def verify; end
  end
end
