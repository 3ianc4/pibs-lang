class Evaluator

  def initialize
    @assignment = {}
  end

  def evaluate(tokens)
      @tokens =  tokens
      return evaluate_assignment()
  end

  private

  def evaluate_assignment()
    
    if current_token.integer_type?
      get_next_token()
      var = ""
      until current_token.value == "="
          var << current_token.value
          get_next_token()
      end
      get_next_token()
      @assignment[var] = evaluate_second_level_precedence()

      if @assignment[var].class != Integer
        raise "error: incompatible types"
      end
      return @assignment[var]
    else
      evaluate_second_level_precedence()
    end
  end

  def evaluate_first_level_precedence
    result = evaluate_parenthesis()

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

  def evaluate_parenthesis()
    if current_token.left_paren?()
      get_next_token()
      result = evaluate_second_level_precedence()
      get_next_token()
    elsif (current_token.sum? || current_token.sub?)
      return 0
    elsif (current_token.mult? || current_token.div?)
      raise "Expression started with invalid operator"
    elsif @assignment.has_key?(current_token.value)
      puts "Entrou aqui"
      return @assignment[current_token.value]
      get_next_token()
    else
      result = current_token.value
      get_next_token()
    end
    return result
  end
end
