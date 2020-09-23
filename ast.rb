class AST
    attr_accessor :type, :identifier, :value
    def initialize(type, identifier, value)
        @type = type
        @identifier = identifier
        @value = value
    end
end
