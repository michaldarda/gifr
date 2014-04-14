require 'RMagick'
include Magick

class GifCreator
  def initialize(gifs = [], options = {})
    @gifs = ImageList.new(*gifs)
    @output = options.fetch(:output)
  end

  def make_gif!
    @gifs.delay = 20
    @gifs.write(@output)
  end
end
