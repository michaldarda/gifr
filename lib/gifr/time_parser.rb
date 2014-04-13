require 'time'

class TimeParser
  def self.parse(time)
    Time.parse(time)
  rescue ArgumentError
    if block_given?
      yield
    else
      raise
    end
  end
end
