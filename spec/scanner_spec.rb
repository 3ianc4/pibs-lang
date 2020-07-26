require './scanner'
RSpec.describe Scanner, "#tokenizer" do
  it "generate token for single digit expression" do
    scanner = Scanner.new
    tokens = scanner.tokenizer "1"
    expect(tokens.size).to eq(1)
    expect(tokens.first).to be_a(Token)
    expect(tokens.first.type).to eq("integer")
    expect(tokens.first.value).to eq(1)
  end
  it "generate token for two digits expression" do
    scanner = Scanner.new
    tokens = scanner.tokenizer "11"
    expect(tokens.size).to eq(1)
    expect(tokens.first).to be_a(Token)
    expect(tokens.first.type).to eq("integer")
    expect(tokens.first.value).to eq(11)
  end

  it "generate token for expression with sum operation" do
    scanner = Scanner.new
    tokens = scanner.tokenizer "1+1"
    expect(tokens.size).to eq(3)
    expect(tokens[1]).to be_a(Token)
    expect(tokens[1].type).to eq("operator")
    expect(tokens[1].value).to eq("+")
  end
  it "allow one digit expression with space" do
    scanner = Scanner.new
    tokens = scanner.tokenizer "1 "
    expect(tokens.size).to eq(1)
    expect(tokens.first).to be_a(Token)
    expect(tokens.first.type).to eq("integer")
    expect(tokens.first.value).to eq(1)
  end
  xit "reject charactere" do
    scanner = Scanner.new
    expect{scanner.tokenizer("a")}.to raise_error("Unexpected value found at the 0 column!")
  end

  it "generate integer variable token" do
    scanner = Scanner.new
    tokens = scanner.tokenizer "int a"
    expect(tokens.size).to eq(2)
    expect(tokens.first).to be_a(Token)
    expect(tokens.first.type).to eq("int")
    expect(tokens.first.value).to eq("int")
    expect(tokens[1]).to be_a(Token)
    expect(tokens[1].type).to eq("id")
    expect(tokens[1].value).to eq("a")
  end
end
