# frozen_string_literal: true

module TermiiRuby
  class AbstractClient
    def make_get_request
      raise NotImplementedError, "Subclasses must implement the make_get_request method"
    end

    def make_post_request
      raise NotImplementedError, "Subclasses must implement the make_post_request method"
    end
  end
end
