class OptionsValidator
  attr_reader :errors

  def initialize(options)
    @options = options
    @errors = {}
  end

  def validate!
    @options.fetch(:start) { @errors[:start] = "You must provide start" }
    @options.fetch(:time) { @errors[:time] = "You must provide time" }
    @options.fetch(:filename) { @errors[:filename] = "You must provide filename" }

    @errors
  end
end
