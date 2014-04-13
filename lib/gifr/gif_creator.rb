require 'RMagick'
include Magick

class GifCreator
  def initialize(gifs = [])
    @gifs = ImageList.new(*gifs)
  end

  def make_gif!
    @gifs.delay = 20
    @gifs.write("video.gif")
  end
end
