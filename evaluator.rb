class Evaluator

  def evaluate(tokens)
      @tokens =  tokens
      result = evaluate_1_level()
      while operation_sum_or_sub?
        token = @tokens.first
        if @tokens.first.sum?
          get_next_token()
          result += evaluate_1_level()
        elsif @tokens.first.sub?
          get_next_token()
          result -= evaluate_1_level()
        end
      end

      return result
  end

  private

  def evaluate_1_level
    result = @tokens.first.value
    get_next_token()

    while operation_mult_or_div?
      if @tokens.first.mult?
        get_next_token()
        result *= @tokens.first.value
        get_next_token()
      elsif @tokens.first.div?
        get_next_token()
        result /= @tokens.first.value
        get_next_token()
      end
    end

    return result
  end

  def operation_sum_or_sub?()
    !@tokens.empty? && (@tokens.first.sum? || @tokens.first.sub?)
  end
  
  def operation_mult_or_div?()
    !@tokens.empty? && (@tokens.first.mult? || @tokens.first.div?)
  end

  def get_next_token()
    @tokens = @tokens.drop(1)
  end
end
