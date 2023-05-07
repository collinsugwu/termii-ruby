# frozen_string_literal: true

# Base Class
module TermiiRuby
  class Termii
    include TermiiRuby::Mixins::Endpoints

    def verify
      raise NotImplementedError, "Subclasses must implement the verify method"
    end
  end
end
