require 'pathname'

class MovieScreenshoter
  attr_reader :screenshots

  def initialize(movie, options = {})
    @movie = movie
    @start = options.fetch(:start)
    @duration = Integer(options.fetch(:time))
  end

  def take_screenshots!
    %x{ ffmpeg -v quiet -ss #{@start} -i #{@movie} -f image2 -vf fps=fps=1 /tmp/gifr_#{@movie.filename}_%d.png }

    @screenshots = @duration.times.map do |i|
      "/tmp/gifr_#{@movie.filename}_#{i+1}.png"
    end
  end
end
