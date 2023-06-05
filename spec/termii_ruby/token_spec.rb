# frozen_string_literal: true

RSpec.describe TermiiRuby::Sender do
  describe "#execute" do
    let(:sender) { TermiiRuby::Sender.new(ENV["TERMII_API_KEY"]) }

    it "fetches the sender details" do
      body = [{
        "current_page": 1,
        "data": [
          {
            "sender_id": "ACME Key",
            "status": "unblock",
            "company": "ACME",
            "usecase": nil,
            "country": nil,
            "created_at": "2021-03-29 16:51:53"
          }

        ],
        "first_page_url": "https://api.ng.termii.com/api/sender-id?page=1",
        "from": 1,
        "last_page": 47,
        "last_page_url": "https://api.ng.termii.com/api/sender-id?page=47",
        "next_page_url": "https://api.ng.termii.com/api/sender-id?page=2",
        "path": "https://api.ng.termii.com/api/sender-id",
        "per_page": 10,
        "prev_page_url": nil,
        "to": 15,
        "total": 704
      }]

      stub_request(:get, "https://api.ng.termii.com/api/sender-id?api_key")
        .with(
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "Content-Type" => "application/json",
            "User-Agent" => "Faraday v2.7.4"
          }
        )
        .to_return(status: 200, body: body, headers: {})

      res = sender.fetch_senders
      expect(res[:status]).to(be(200))
      expect(res[:data][0][:data][0][:sender_id]).to(be("ACME Key"))
    end
  end
end
