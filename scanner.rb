require './token'

class Scanner
    VALID_DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    VALID_OPERATORS = ["+", "-"]
    
    def tokenizer(values)
        tokens = []
        values = values.gsub(" ", "")
        pointer = 0
        while pointer < values.size
            if values.match(/\d+/)
                integer_tokens = values.scan(/\d+/)
                tokens << Token.new("integer", integer_tokens.first.to_i)
                pointer += integer_tokens.first.size
            elsif is_valid_operator_use?(values, pointer)
                pointer += 1
                nil
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