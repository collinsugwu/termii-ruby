# frozen_string_literal: true

# Handles external request to termii
require "faraday"
require "faraday/retry"

module TermiiRuby
  class Client
    def initialize(api_key)
      @api_key = api_key
      @connection = faraday_connection
    end

    def make_get_request(endpoint, _args = {})
      url = request_url(endpoint)
      response = @connection.get(url) do |req|
        req.params["api_key"] = @api_key
        req.headers["Content-Type"] = "application/json"
      end

      {
        status: response.status,
        data: response.body
      }
    end

    def make_post_request(endpoint, args = {})
      url = request_url(endpoint)
      args[:api_key] = @api_key
      response = @connection.post(url) do |req|
        req.headers["Content-Type"] = "application/json"
        req.body = args.to_json
      end

      {
        status: response.status,
        data: response.body
      }
    end

    private

    def request_url(endpoint)
      "#{base_url}/#{endpoint}"
    end

    def faraday_connection
      Faraday.new do |f|
        f.options.timeout = 30
        f.request :retry # retry transient failures
        f.response :json # decode response bodies as JSON
      end
    end

    def base_url
      "https://api.ng.termii.com/api"
    end
  end
end
