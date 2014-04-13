require_relative '../../lib/gifr/time_parser'

describe TimeParser do
  describe "#parse" do
    it 'takes time in string and returns its representation in seconds' do
      expect(TimeParser.new("1h1m1s").parse).to eq 3661
    end

    it 'takes time in string and returns its representation in seconds \
        when minutes are missing' do
      expect(TimeParser.new("1h1s").parse).to eq 3601
    end

    it 'takes time in string and returns its representation in seconds \
        when hours are missing' do
      expect(TimeParser.new("10m1s").parse).to eq 601
    end

    it 'takes time in string and returns its representation in seconds \
        when order is inverted' do
      skip
      expect(TimeParser.new("59s10h15m").parse).to eq 36959
    end
  end

  describe "#validate" do
    it 'returns parsed time if input string was correct' do
      expect(TimeParser.new("1h1m1s").validate!)
    end

    it 'raises exceptions when input string was incorrect' do
      expect{TimeParser.new("notime").validate!}.to raise_error
    end

    it 'raises exceptions when input string was incorrect - mixed' do
      expect{TimeParser.new("notime1h5s1m").validate!}.to raise_error
    end

    it 'raises exceptions when input string was incorrect - mixed' do
      expect{TimeParser.new("40d1h5s1m").validate!}.to raise_error
    end

    it 'can handle expection when block given' do
      expect{ TimeParser.new("notime").validate! do
        "My fancy exception handling"
      end }.to_not raise_error
    end
  end
end
