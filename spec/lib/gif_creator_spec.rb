require_relative '../../lib/gifr/gif_creator'

describe GifCreator do
  it 'makes a gif from selected videos' do
    movie = Movie.new(filename: "spec/fixtures/example1.mp4")
    movie_screenshoter = MovieScreenshoter.new(movie, start: "00:00:00", time: "6")

    movie_screenshoter.take_screenshots!
    screenshots = movie_screenshoter.screenshots

    gif_creator = GifCreator.new(screenshots)
    gif_creator.make_gif!

    expect(File.exists?("video.gif")).to eq true
  end
end
