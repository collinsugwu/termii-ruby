class TermiiToken < Termii

    const MESSAGE_TYPE = 'NUMERIC'
    const CHANNEL = 'generic'
    const PIN_ATTEMPTS = 3
    const PIN_LENGTH = 4
    const PIN_TIME_TO_LEAVE = 1 
    const PIN_PLACEHOLDER = "< _pin_ >"

    def initialize(api_key)
        @api_key = api_key
        @client =|| SportsData::Client.new(@api_key)
    end

    def send_otp_token(to, from, message_text, channel = CHANNEL, message_type = MESSAGE_TYPE,
        pin_attampts = PIN_ATTEMPTS, pin_length = PIN_LENGTH, pin_placeholder = PIN_PLACEHOLDER, pin_time_to_live  = PIN_TIME_TO_LEAVE)
        data = {
            to: to,
            from: from,
            message_text: message_text,
            channel: channel,
            message_type: message_type,
            pin_attampts: pin_attampts,
            pin_length: pin_length,
            pin_placeholder: pin_placeholder,
            pin_time_to_live: pin_time_to_live,
        }
        @client.make_post_request(SEND_OTP_TOKEN, data)
    end


    def send_voice_token(phone_number, pin_attampts = PIN_ATTEMPTS, pin_length = PIN_LENGTH, pin_time_to_live  = PIN_TIME_TO_LEAVE)
        data = {
            phone_number: phone_number,
            pin_attampts: pin_attampts,
            pin_length: pin_length,
            pin_time_to_live: pin_time_to_live,
        }
        @client.make_post_request(SEND_OTP_TOKEN, data)
    end

    def verify(pin_id, pin)
        data = {
            pin_id: pin_id,
            pin: pin
        }
        @client.make_post_request(VERIFY_TOKEN, data)
    end
end