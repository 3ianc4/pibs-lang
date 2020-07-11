class Evaluator

  def evaluate(tokens)
      @tokens =  tokens
      result = evaluate_1_level
      while !@tokens.empty? && (@tokens.first.sum? || @tokens.first.sub?)
        token = @tokens.first
        if @tokens.first.sum?
          @tokens = @tokens.drop(1)
          result += evaluate_1_level
        elsif @tokens.first.sub?
          @tokens = @tokens.drop(1)
          result -= evaluate_1_level
        end
      end

      return result
  end

  private

  def evaluate_1_level
    result = @tokens.first.value
    @tokens = @tokens.drop(1)

    while !@tokens.empty? && (@tokens.first.mult? || @tokens.first.div?)
      if @tokens.first.mult?
        @tokens = @tokens.drop(1)
        result *= @tokens.first.value
        @tokens = @tokens.drop(1)
      elsif @tokens.first.div?
        @tokens = @tokens.drop(1)
        result /= @tokens.first.value
        @tokens = @tokens.drop(1)
      end
    end

    return result
  end
end