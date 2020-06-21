require './token'

class Scanner
    def tokenizer(values)
        tokens = []
        values = values.gsub(" ", "")
        pointer = 0
        while !values.empty?
            if values.match(/^\d+/)
                integer_tokens = values.scan(/^\d+/)
                tokens << Token.new("integer", integer_tokens.first.to_i)
                pointer += integer_tokens.first.size
                values = values.sub(/^\d+/, "")
            elsif values.match(/^\+|^\-/)
                operator_tokens = values.scan(/^\+|^\-/)
                tokens << Token.new("operator", operator_tokens.first)
                pointer += 1
                values = values.sub(/^\+|^\-/, "")
            else
                raise "Unexpected value found!"
            end
        end
        return tokens
    end

    private
   
    def is_valid_operator_use?(values, pointer)
        VALID_OPERATORS.include?(values[pointer])
    end
end