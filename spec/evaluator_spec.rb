require './evaluator'
require './token'

RSpec.describe Evaluator, "#evaluate" do
    it "evaluates token's result" do
        evaluator = Evaluator.new
        token = Token.new("integer", 1)
        result = evaluator.evaluate([token])
        expect(result).to eq 1
    end
    
    it "evaluates simple sum operation" do
        evaluator = Evaluator.new
        tokens = [Token.new("integer", 1), Token.new("operator", "+"), Token.new("integer", 1)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 2
    end

    it "evaluates complex sum operation" do
        evaluator = Evaluator.new
        tokens = [ 
            Token.new("integer", 1), 
            Token.new("operator", "+"), 
            Token.new("integer", 1), 
            Token.new("operator", "+"), 
            Token.new("integer", 1)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 3
    end

    it "evaluates operation with operators in first position" do
        evaluator = Evaluator.new
        tokens = [Token.new("operator", "+"), Token.new("integer", 1)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 1
    end

    it "evaluates simple subtraction operation" do
        evaluator = Evaluator.new
        tokens = [Token.new("integer", 1), Token.new("operator", "-"), Token.new("integer", 1)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 0
    end

    it "evaluates complex subtraction operation" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("integer", 1),
            Token.new("operator", "-"),
            Token.new("integer", 1),
            Token.new("operator", "-"),
            Token.new("integer", 1)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq -1
    end
    
    it "evaluates operation with subtraction in first position" do
        evaluator = Evaluator.new
        tokens = [Token.new("operator", "-"), Token.new("operator", 1)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq -1
    end

    it "evaluates operation with both operators" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("integer", 1),
            Token.new("operator", "+"),
            Token.new("integer", 1),
            Token.new("operator", "-"),
            Token.new("integer", 1),
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 1
    end

end