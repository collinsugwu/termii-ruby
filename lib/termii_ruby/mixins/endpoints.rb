# frozen_string_literal: true

module TermiiRuby
  module Mixins
    module Endpoints
      FETCH_SENDER = "sender-id"
      CREATE_SENDER = "sender-id/request"
      SEND_OTP_TOKEN = "sms/otp/send"
      VERIFY_TOKEN = "sms/otp/verify"
      SEND_VOICE_CALL = "sms/otp/call"
      SEND_VOICE_TOKEN = "sms/otp/send/voice"
      SEND_IN_APP_TOKEN = "sms/otp/generate"
      GET_BALANCE = "get-balance"
      SEARCH = "check/dnd"
      STATUS = "insight/number/query"
      HISTORY = "sms/inbox"
    end
  end
end
