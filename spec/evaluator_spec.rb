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

    it "evaluates plus operator in first position" do
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

    it "evaluates minus operator in first position" do
        evaluator = Evaluator.new
        tokens = [Token.new("operator", "-"), Token.new("operator", 1)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq -1
    end

    it "evaluates operation with plus and minus" do
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

    it "evaluates times operator in first position" do
        evaluator = Evaluator.new
        tokens = [Token.new("operator", "*"), Token.new("integer", 1)]
        expect{evaluator.evaluate(tokens)}.to raise_error("Expression started with invalid operator") 
    end

    it "evaluates simple multiplication" do
        evaluator = Evaluator.new
        tokens = [Token.new("integer", 2), Token.new("mult", "*"), Token.new("integer", 3)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 6
    end

    it "evaluates complex multiplication" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("integer", 2),
            Token.new("mult", "*"),
            Token.new("integer", 1), 
            Token.new("mult", "*"),
            Token.new("integer", 2)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 4
    end

    it "evaluates division operator in first position" do
        evaluator = Evaluator.new
        tokens = [Token.new("operator", "/"), Token.new("integer", 1)]
        expect{evaluator.evaluate(tokens)}.to raise_error("Expression started with invalid operator") 
    end

    it "evaluate simple division" do
        evaluator = Evaluator.new
        tokens = [Token.new("integer", 4), Token.new("div", "/"), Token.new("integer", 2)]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 2
    end

    it "evaluates complex division" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("integer", 20),
            Token.new("div", "/"),
            Token.new("integer", 5), 
            Token.new("div", "/"),
            Token.new("integer", 2)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 2
    end

    it "evaluates operation with four operators" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("integer", 4),
            Token.new("operator", "+"),
            Token.new("integer", 8),
            Token.new("operator", "*"),
            Token.new("integer", 2),
            Token.new("operator", "-"),
            Token.new("integer", 10),
            Token.new("operator", "/"),
            Token.new("integer", 2)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 15
    end

    it "evaluates single expression with parenthesis" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("rightparen", ")")
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 10
    end
    it "evaluates sum operation with parenthesis" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("operator", "+"),
            Token.new("integer", 10),
            Token.new("rightparen", ")")
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 20
    end

    it "evaluates sum operation with parenthesins before operator" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("rightparen", ")"),
            Token.new("operator", "+"),
            Token.new("integer", 10)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 20
    end


    it "evaluates multiplication expression with parenthesis" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("operator", "*"),
            Token.new("integer", 5),
            Token.new("rightparen", ")"),
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 50
    end

    it "evaluates sum inside and outside parenthesis" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("operator", "+"),
            Token.new("integer", 10),
            Token.new("rightparen", ")"),
            Token.new("operator", "+"),
            Token.new("integer", 10)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 30
    end

    it "evaluates operation with parenthesis and mixed operators" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("operator", "+"),
            Token.new("integer", 10),
            Token.new("rightparen", ")"),
            Token.new("operator", "*"),
            Token.new("integer", 5)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 100
    end

    it "evaluates complex operation with parenthesis and mixed operators" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("operator", "*"),
            Token.new("integer", 4),
            Token.new("rightparen", ")"),
            Token.new("operator", "-"),
            Token.new("integer", 10),
            Token.new("operator", "/"),
            Token.new("integer", 2)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 35
    end

    it "evaluates omplex operation with more than one parenthesis" do
        evaluator = Evaluator.new
        tokens = [
            Token.new("leftparen", "("),
            Token.new("integer", 10),
            Token.new("operator", "+"),
            Token.new("leftparen", "("),
            Token.new("integer", 3),
            Token.new("operator", "*"),
            Token.new("integer", 5),
            Token.new("rightparen", ")"),
            Token.new("operator", "-"),
            Token.new("integer", 5),
            Token.new("rightparen", ")"),
            Token.new("operator", "/"),
            Token.new("integer", 2)
        ]
        result = evaluator.evaluate(tokens)
        expect(result).to eq 10
    end
    
end