class TermiiSender < Termii
    def initialize(api_key)
        @api_key = api_key
        @client = SportsData::Client.new(@api_key)
    end

    def create_sender(sender_id, usecase, company)
        data = {
            sender_id: sender_id,
            usecase: usecase,
            company: company
        }
        @client.make_post_request(CREATE_SENDER, data)
    end

    def fetch_sender
        @client.make_get_request(FETCH_SENDER)
    end
end