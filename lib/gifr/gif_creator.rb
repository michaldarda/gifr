require 'RMagick'
include Magick

class GifCreator
  def initialize(gifs = [], options = {})
    @gifs = ImageList.new(*gifs)
    @output = options.fetch(:output)
    @delay = options.fetch(:delay) { 20 }
  end

  def make_gif!
    @gifs.delay = @delay
    @gifs.write(@output)
  end
end
