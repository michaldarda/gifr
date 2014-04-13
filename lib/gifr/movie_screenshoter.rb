class MovieScreenshoter
  def initialize(movie, options = {})
    @movie = movie
    @from = options.fetch(:from)
    @to = options.fetch(:to)
  end

  def screenshot
    %x{ ffmpeg -ss #{@from} -i #{@movie} -f image2 -vf fps=fps=1 /tmp/gifr%d.png }
  end
end
