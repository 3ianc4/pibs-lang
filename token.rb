class Token
    attr_accessor :type, :value
    def initialize(type, value)
        @type = type
        @value = value
    end

    def sum?
        @value == "+"
    end

    def sub?
        @value == "-"
    end

    def mult?
        @value == "*"
    end

    def div?
        @value == "/"
    end

    def left_paren?
        @value == "("
    end

    def right_paren?
        @value == ")"
    end
end