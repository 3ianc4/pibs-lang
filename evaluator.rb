class Evaluator
    def evaluate(tokens)
        result = 0
        until tokens.empty? 
          if tokens.first.sum?
            tokens = tokens.drop(1)
            result += tokens.first.value
            tokens = tokens.drop(1)
          elsif tokens.first.sub?
            tokens = tokens.drop(1)
            result -= tokens.first.value
            tokens = tokens.drop(1)
          else
            result += tokens.first.value
            tokens = tokens.drop(1)
          end
        end
        
        return result
    end
end