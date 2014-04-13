require 'time'

class TimeParser
  UNITS = {
    "h" => 3600,
    "m" => 60,
    "s" => 1
  }

  def initialize(time)
    @time = time
  end

  def parse
    @time = @time.match(/(\d+h)?(\d+m)?(\d+s)?/).to_a.compact

    @time.shift

    raise ArgumentError if @time.empty?

    @time.each do |unit|
      unit = unit.match(/\d[a-z]/)
      raise ArgumentError if unit.nil?
    end

    return convert
 end

  def validate!
    parse
  rescue ArgumentError
    if block_given?
      yield
    else
      raise
    end
  end

  def convert
    time_hash = @time.reduce({}) do |result, unit|
      unit = unit.match(/(\d+)([a-z])/).to_a
      result.merge!({ unit[2] => unit[1] })
    end

    time_hash.each_pair.reduce(0) do |result, (unit, value)|
      result += UNITS.fetch(unit) * value.to_i
    end
  end
end
