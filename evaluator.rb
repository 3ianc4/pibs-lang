class Evaluator

  def evaluate(tokens)
      @tokens =  tokens
      return evaluate_second_level_precedence()
  end

  private

  def evaluate_first_level_precedence
    result = current_token().value
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

  def evaluate_second_level_precedence
    result = evaluate_first_level_precedence()

    while operation_sum_or_sub?
      if current_token.sum?
        get_next_token()
        result += evaluate_first_level_precedence()
      elsif current_token.sub?
        get_next_token()
        result -= evaluate_first_level_precedence()
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
