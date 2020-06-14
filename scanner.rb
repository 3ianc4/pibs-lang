class Scanner
    VALID_DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    VALID_OPERATORS = ["+", "-"]
    
    def tokenizer(values)
        values = values.gsub(" ", "")
        i = 0
        while i < values.size
            if VALID_DIGITS.include?(values[i])
                nil
            elsif is_valid_operator_use?(values, i)
                nil
            else
                raise "Unexpected value found!"
            end
            i += 1
        end
        return nil
    end

    private
   
    def is_valid_operator_use?(values, i)
        VALID_OPERATORS.include?(values[i]) && 
        VALID_DIGITS.include?(values[i-1]) && 
        VALID_DIGITS.include?(values[i+1])
    end
end