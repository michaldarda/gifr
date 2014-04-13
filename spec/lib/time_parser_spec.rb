require_relative '../../lib/gifr/time_parser'

describe TimeParser do
  it 'returns parsed time if input string was correct' do
    expect(TimeParser.parse("1h1m1s"))
  end

  it 'raises expeptions when input string was incorrect' do
    expect{TimeParser.parse("notime")}.to raise_error
  end

  it 'can handle expection when block given' do
    expect{ TimeParser.parse("notime") do
      "My fancy exception handling"
    end }.to_not raise_error
  end
end
