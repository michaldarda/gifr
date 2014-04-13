require 'time'
require_relative 'time_parser'

class OptionsValidator
  attr_reader :errors

  def initialize(options)
    @options = options
    @errors = {}
  end

  def validate!
    @options.fetch(:from) { @errors[:from] = "You must provide from" }
    @options.fetch(:to) { @errors[:to] = "You must provide to" }
    @options.fetch(:filename) { @errors[:filename] = "You must provide filename" }

    return @errors if @errors.any?

    TimeParser.parse(@options[:from]) { @errors[:from] = "From time in incorrect format"}
    TimeParser.parse(@options[:to]) { @errors[:to] = "To time in incorrect format" }

    return @errors
  end
end
