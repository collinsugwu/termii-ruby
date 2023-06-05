# frozen_string_literal: true

RSpec.describe TermiiRuby::Insight do
  describe "#execute" do
    let(:insight) { TermiiRuby::Insight.new(ENV["TERMII_API_KEY"]) }
    let(:phone) { 2_347_089_509_657 }
    it "fetches the balance" do
      body = [{
        "user": "Tayo Joel",
        "balance": 100,
        "currency": "NGN"
      }]

      stub_request(:get, "https://api.ng.termii.com/api/get-balance?api_key")
        .with(
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = insight.balance
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:balance]).to(be(100))
    end

    it "fetches the history" do
      body =    [
        {
          "sender": "N-Alert",
          "receiver": "233257883990",
          "message": "New year in a bit",
          "amount": 1,
          "reroute": 0,
          "status": "DND Active on Phone Number",
          "sms_type": "plain",
          "send_by": "sender",
          "media_url": nil,
          "message_id": "5508751839629937023",
          "notify_url": nil,
          "notify_id": nil,
          "created_at": "2020-08-15 12:36:42"
        }
      ]

      stub_request(:get, "https://api.ng.termii.com/api/sms/inbox?api_key")
        .with(
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = insight.history
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:sender]).to(be("N-Alert"))
    end

    it "fetches the search query" do
      body =    [
        {
          "number": "2347089509657",
          "status": "DND blacklisted",
          "network": "Airtel Nigeria",
          "network_code": "62120"
        }
      ]

      stub_request(:get, "https://api.ng.termii.com/api/check/dnd?api_key&phone_number=2347089509657")
        .with(
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = insight.search(phone)
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:number]).to(be("2347089509657"))
      expect(res[:data][0][:status]).to(be("DND blacklisted"))
    end
  end
end
