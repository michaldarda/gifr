class Movie < Struct.new(:path)
  def length
    @length ||= %x{ ffprobe
      -v quiet
      -show_entries
      format=duration #{to_s} | grep duration
    }.match(/(duration=)(\d+)(.\d+)/)[2]
  end

  def to_s
    "#{path}"
  end
end
