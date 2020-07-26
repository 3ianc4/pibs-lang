require "#{File.dirname(__FILE__)}/token"

VALID_INTEGERS = /^\d+/
VALID_OPERATORS = /^\+|^\-/
VALID_IDENTIFIERS = /\w+/
ASSIGNMENT = /=/

class Scanner

    def initialize
        @pointer = 0
    end

    def tokenizer(values)
        tokens = []
        values = values.gsub(" ", "")
        while !values.empty?
            if is_valid_integer?(values)
                integer_tokens = values.scan(VALID_INTEGERS)
                tokens << Token.new("integer", integer_tokens.first.to_i)
                @pointer += integer_tokens.first.size
                values = values.sub(VALID_INTEGERS, "")
            elsif is_valid_operator?(values)
                operator_tokens = values.scan(VALID_OPERATORS)
                tokens << Token.new("operator", operator_tokens.first)
                @pointer += 1
                values = values.sub(VALID_OPERATORS, "")
            elsif is_identifier?(values)
                result = is_type?(values)
                tokens << result
                values = values.slice!(result.value.size..values.size)
                puts "values = #{values}"
                identifier_tokens = values.scan(VALID_IDENTIFIERS)
                tokens << Token.new("id", identifier_tokens.first)
                @pointer += 1
                values = values.sub(VALID_IDENTIFIERS, "")
            elsif is_assignment?(values)
                puts "TOKENS = #{values}"
                assignment_token = values.scan(ASSIGNMENT)
                tokens << Token.new("assignment", assignment_token.first)
                @pointer += 1
                values = values.sub(ASSIGNMENT, "")
            else
                raise "Unexpected value found at the #{@pointer} column!"
            end
        end
        return tokens
    end

    private
    
    def is_valid_integer?(values)
        values.match(VALID_INTEGERS)
    end

    def is_valid_operator?(values)
        values.match(VALID_OPERATORS)
    end

    def is_valid_operator_use?(values, pointer)
        VALID_OPERATORS.include?(values[pointer])
    end

    def is_identifier?(values)
        values[0].match(VALID_IDENTIFIERS)
    end

    def is_assignment?(values)
        values.match(ASSIGNMENT)
    end

    def is_type?(values)

        data_type = {
        "int" => Token.new("int", "int")
        }

        buffer = ""
        while !values.empty?
            buffer << values[0]
            values = values.slice(1..values.size)
            if data_type.has_key? buffer
                return data_type[buffer]
                break
            end
        end
    end
end