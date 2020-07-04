require './token'
class Evaluator
    def evaluate(tokens)
        result = 0
        until tokens.empty?
          if tokens[0].value == "+"
            tokens = tokens.drop(1)
            result += tokens[0].value
            tokens = tokens.drop(1)
          else
            result += tokens[0].value
            tokens = tokens.drop(1)
          end
        end
        
        return result
    end
end