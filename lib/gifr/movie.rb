class Movie
  def initialize(options = {})
    @path = options.fetch(:filename)

    raise ArgumentError unless File.exists?(@path)
  end

  def length
    @length ||= Integer(%x{ ffprobe -v quiet -show_entries format=duration #{to_s} | grep duration }.match(/(duration=)(\d+)(.\d+)/)[2])
  end

  def to_s
    "#{to_path}"
  end

  def to_path
    Pathname.new(@path)
  end

  def filename
    to_path.basename
  end
end
