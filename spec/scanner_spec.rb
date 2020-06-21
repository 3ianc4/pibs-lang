require './scanner'
RSpec.describe Scanner, "#tokenizer" do
  it "generate token for single digit expression" do
    scanner = Scanner.new
    tokens_array = scanner.tokenizer "1"
    expect(tokens_array.size).to eq(1)
    expect(tokens_array.first).to be_a(Token)
    expect(tokens_array.first.type).to eq("integer")
    expect(tokens_array.first.value).to eq(1)
  end
  it "generate token for two digits expression" do
    scanner = Scanner.new
    tokens_array = scanner.tokenizer "11"
    expect(tokens_array.size).to eq(1)
    expect(tokens_array.first).to be_a(Token)
    expect(tokens_array.first.type).to eq("integer")
    expect(tokens_array.first.value).to eq(11)
  end

  it "generate token for expression with sum operation" do
    scanner = Scanner.new
    tokens_array = scanner.tokenizer "1+1"
    expect(tokens_array.size).to eq(3)
    expect(tokens_array[1]).to be_a(Token)
    expect(tokens_array[1].type).to eq("operator")
    expect(tokens_array[1].value).to eq("+")
  end
  it "allow one digit expression with space" do
    scanner = Scanner.new
    tokens_array = scanner.tokenizer "1 "
    expect(tokens_array.size).to eq(1)
    expect(tokens_array.first).to be_a(Token)
    expect(tokens_array.first.type).to eq("integer")
    expect(tokens_array.first.value).to eq(1)
  end
  it "reject charactere" do
    scanner = Scanner.new
    expect{scanner.tokenizer("a")}.to raise_error("Unexpected value found!")
  end
end