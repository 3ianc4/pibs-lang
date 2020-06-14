class Scanner
    def tokenizer(values)
        values = values.gsub(" ", "")
        valid_digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        valid_operators = ["+", "-"]
        valid_tokens = valid_digits + valid_operators
        i = 0
        while i < values.size
            if valid_digits.include?(values[i])
                nil
            elsif valid_operators.include?(values[i]) && valid_digits.include?(values[i-1]) && valid_digits.include?(values[i+1])
                nil
            else
                raise "Unexpected value found!"
            end
            i += 1
        end
        return nil
    end
end