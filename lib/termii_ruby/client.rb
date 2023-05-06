module TermiiRuby
    class Client
        def initialize(api_key)
          @api_key = api_key
          @connection = faraday_connection
        end

        def make_get_request(endpoint, args = {})
            url = request_url(endpoint)
            response = @connection.get(url) do |req|
                req.params['api_key'] = @api_key
                req.headers['Content-Type'] = 'application/json'
            end

            return response.body if response.success?

            msg = "unsuccessful request with status code #{response.status}"
            raise TermiiRuby::Error, msg
        end

        def make_post_request(endpoint, args = {})
            url = request_url(endpoint)
            args[:api_key] = @api_key
            response = @connection.post('url') do |req|
                req.headers['Content-Type'] = 'application/json'
                 req.body =  args
            end

            return response.body if response.success?

            msg = "unsuccessful request with status code #{response.status}"
            raise TermiiRuby::Error, msg
        end

        private

        def request_url(endpoint)
            url = "#{base_url}/#{endpoint}"
        end

        def faraday_connection
            Faraday.new do |f|
                f.options.timeout = 30
                f.request :retry # retry transient failures
                f.response :json # decode response bodies as JSON
                f.response :raise_error
            end
        end
        
        def base_url
            'https://api.ng.termii.com/api'
        end
    end
end
