class Termii
    include Mixins::Endpoints

    def verify
        raise NotImplementedError, "Subclasses must implement the verify method"
    end
end
