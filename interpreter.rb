require './scanner'
require './evaluator'

class Interpreter
    def initialize(program)
        @program = program
        @scanner = Scanner.new
        @evaluator = Evaluator.new
        @lines = File.read(@program).split
        @current_line = 0
    end

    def read_line
        current_line_content = @lines[@current_line]
        tokens = @scanner.tokenizer(current_line_content)
        result = @evaluator.evaluate(tokens)
        @current_line += 1
        return result
    end
end