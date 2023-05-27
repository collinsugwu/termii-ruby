# frozen_string_literal: true

# Performs insight operation
require_relative "termii"
require_relative "client"

module TermiiRuby
  class Insight < TermiiRuby::Termii
    QUERY = "phone_number"

    def initialize(api_key)
      super()
      @client = TermiiRuby::Client.new(api_key)
    end

    def verify; end

    def balance
      @client.make_get_request(GET_BALANCE)
    end

    def search(phone_number, query = {})
      if query.empty?
        query = {
          phone_number: phone_number
        }
      end

      @client.make_get_request(SEARCH, query)
    end

    def status(phone_number, query = {})
      if query.empty?
        query = {
          phone_number: phone_number,
          country_code: @country_code
        }
      end
      @client.make_get_request(STATUS, query)
    end

    def history
      @client.make_get_request(HISTORY)
    end
  end
end
