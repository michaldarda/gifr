require_relative '../../lib/gifr/movie'

describe Movie do
  it "should raise ArgumentError if file not exists" do
    expect{Movie.new({filename: "example.mp4"})}.to raise_error
  end

  it "should instantiate correctly if file exists" do
    expect{Movie.new({filename: "spec/fixtures/example1.mp4"})}.to_not raise_error
  end

  it "should return movie length correctly" do
    movie = Movie.new(filename: "spec/fixtures/example1.mp4")
    expect(movie.length).to eq 6

    movie2 = Movie.new(filename: "spec/fixtures/example2.mp4")
    expect(movie2.length).to eq 6

    movie3 = Movie.new(filename: "spec/fixtures/example3.mp4")
    expect(movie3.length).to eq 5
  end
end
