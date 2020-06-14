require './scanner'
RSpec.describe Scanner, "#tokenizer" do
  it "allow one digit expression" do
    scanner = Scanner.new
    token = scanner.tokenizer "1"
    expect(token).to eq nil
  end
  it "allow two digits expression" do
    scanner = Scanner.new
    token = scanner.tokenizer "11"
    expect(token).to eq nil
  end
  it "allow expression with operators" do
    scanner = Scanner.new
    token = scanner.tokenizer "1+1"
    expect(token).to eq nil
  end
  it "allow one digit expression with space" do
    scanner = Scanner.new
    token = scanner.tokenizer "1 "
    expect(token).to eq nil
  end
  it "reject operator only" do
    scanner = Scanner.new
    token = scanner.tokenizer "+"
    expect(token).to eq 1
  end
end

