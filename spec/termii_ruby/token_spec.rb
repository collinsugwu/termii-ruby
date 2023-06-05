# frozen_string_literal: true

RSpec.describe TermiiRuby::Token do
  describe "#execute" do
    let(:token) { TermiiRuby::Token.new(ENV["TERMII_API_KEY"]) }
    let(:to) { "2348109077743" }
    let(:from) { "ACME" }
    let(:message) { " your token is < 1234 > " }
    let(:pin_id) { "c8dcd048-5e7f-4347-8c89-4470c3af0b" }
    let(:pin_token) { "195558" }

    it "sends an otp" do
      body = [
        {
          "pinId": "29ae67c2-c8e1-4165-8a51-8d3d7c298081",
          "to": "2348109077743",
          "smsStatus": "Message Sent"
        }
      ]

      stub_request(:post, "https://api.ng.termii.com/api/sms/otp/send")
        .with(
          body: {"to": "2348109077743","from": "ACME", "message_text": " your token is < 1234 > ","channel": "generic", "message_type": "NUMERIC", "pin_attempts": 3, "pin_length": 4, "pin_placeholder": "< 1234 >", "pin_time_to_live": 10, "pin_type": "NUMERIC", "api_key": nil},
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = token.send_otp_token(to, from, message)
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:pinId]).to(be("29ae67c2-c8e1-4165-8a51-8d3d7c298081"))
    end

    it "sends a voice otp" do
      body = [
        {
          "code": "ok",
          "message_id": "453166532802459832",
          "pinId": "29ae67c2-c8e1-4165-8a51-8d3d7c298081",
          "message": "Successfully Sent",
          "balance": 77.5,
          "user": "Termii Test"
        }
      ]

      stub_request(:post, "https://api.ng.termii.com/api/sms/otp/send/voice")
        .with(
          body: {"phone_number": "2348109077743", "pin_attempts": 3, "pin_length":4, "pin_time_to_live":10, "api_key": nil},
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = token.send_voice_token(to)
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:pinId]).to(be("29ae67c2-c8e1-4165-8a51-8d3d7c298081"))
      expect(res[:data][0][:message_id]).to(be("453166532802459832"))
    end

    it "sends an otp the" do
      body = [
        {
          "pinId": "c8dcd048-5e7f-4347-8c89-4470c3af0b",
          "verified": "True",
          "msisdn": "2348109077743"
        }
      ]

      stub_request(:post, "https://api.ng.termii.com/api/sms/otp/verify")
        .with(
          body: {"pin_id": "c8dcd048-5e7f-4347-8c89-4470c3af0b","pin": "195558","api_key": nil},
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = token.verify(pin_id, pin_token)
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:pinId]).to(be("c8dcd048-5e7f-4347-8c89-4470c3af0b"))
      expect(res[:data][0][:msisdn]).to(be("2348109077743"))
    end
  end
end
