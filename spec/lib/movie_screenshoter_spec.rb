require_relative '../spec_helper'
require_relative '../../lib/gifr/movie_screenshoter'

describe MovieScreenshoter do
  it 'takes a screenshots of a movie every 1 second for selected \
      time period and start time and returns an array of created \
      screenshots' do
    movie = Movie.new(filename: 'spec/fixtures/example1.mp4')
    movie_screenshoter = MovieScreenshoter.new(movie, { start: "00:00:00", time: "6"})
    movie_screenshoter.take_screenshots!

    expect(movie_screenshoter.screenshots)
      .to match_array ["/tmp/gifr_example1.mp4_1.png", "/tmp/gifr_example1.mp4_2.png",
        "/tmp/gifr_example1.mp4_3.png", "/tmp/gifr_example1.mp4_4.png",
        "/tmp/gifr_example1.mp4_5.png", "/tmp/gifr_example1.mp4_6.png"]
  end

  it 'takes a screenshots of a movie every 1 second for selected \
      time period and start time and takes that screenshots' do
    movie = Movie.new(filename: 'spec/fixtures/example1.mp4')
    movie_screenshoter = MovieScreenshoter.new(movie, { start: "00:00:00", time: "6"})

    movie_screenshoter.take_screenshots!

    movie_screenshoter.screenshots.each do |screenshot|
      expect(File.exists?(screenshot)).to eq true
    end
  end
end
