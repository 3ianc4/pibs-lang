class Evaluator

  def evaluate(tokens)
      @tokens =  tokens
      result = evaluate_1_level()

      while operation_sum_or_sub?
        if current_token.sum?
          get_next_token()
          result += evaluate_1_level()
        elsif current_token.sub?
          get_next_token()
          result -= evaluate_1_level()
        end
      end

      return result
  end

  private

  def evaluate_1_level
    result = current_token.value
    get_next_token()

    while operation_mult_or_div?
      if current_token.mult?
        get_next_token()
        result *= current_token.value
        get_next_token()
      elsif current_token.div?
        get_next_token()
        result /= current_token.value
        get_next_token()
      end
    end

    return result
  end

  def operation_sum_or_sub?()
    !@tokens.empty? && (current_token.sum? || current_token.sub?)
  end
  
  def operation_mult_or_div?()
    !@tokens.empty? && (current_token.mult? || current_token.div?)
  end

  def get_next_token()
    @tokens = @tokens.drop(1)
  end

  def current_token
    @tokens.first
  end
end
