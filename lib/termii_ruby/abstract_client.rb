# frozen_string_literal: true

module TermiiRuby
  #
  # @author Collins
  # A class to enforce the request methods
  # @abstract
  #
  class AbstractClient
    #
    # Ensure the subclass implements the make_get_request method
    #
    # @return [Object] NotImplementedError
    #
    def make_get_request
      raise NotImplementedError, "Subclasses must implement the make_get_request method"
    end

    #
    # Ensure the subclass implements the make_post_request method
    #
    # @return [Object] NotImplementedError
    #
    def make_post_request
      raise NotImplementedError, "Subclasses must implement the make_post_request method"
    end
  end
end
