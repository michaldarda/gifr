require 'pathname'

class MovieScreenshoter
  attr_reader :screenshots

  def initialize(movie, options = {})
    @movie = movie
    @start = options.fetch(:start)
    @time = Integer(options.fetch(:time))
  end

  def take_screenshots!
    %x{ ffmpeg -v quiet -ss #{@start} -i #{@movie} -f image2 -vf fps=fps=1 /tmp/gifr_#{Pathname.new(@movie.to_s).basename}_%d.png }

    @screenshots = @time.times.map do |i|
      "/tmp/gifr_#{Pathname.new(@movie.to_s).basename}_#{i+1}.png"
    end
  end

  def cleanup!
    screenshots.each do |screenshot|
      %x[ rm -r -f /tmp/#{screenshot} ]
    end
  end
end
