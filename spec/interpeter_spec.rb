require './interpreter'

RSpec.describe Interpreter, "#read_line" do
    it "read line and return the result" do
        interpreter = Interpreter.new("./spec/simple_expression.pibs")
        result = interpreter.read_line()
        expect(result).to eq 1
    end
    it "read multiple lines and return the result" do
        interpreter = Interpreter.new("./spec/multiple_expressions.pibs")
        first_line_result = interpreter.read_line()
        expect(first_line_result).to eq 1
        second_line_result = interpreter.read_line()
        expect(second_line_result).to eq 2
    end
end