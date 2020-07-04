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
end
