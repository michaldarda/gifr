require_relative '../../lib/gifr/options_validator'

describe OptionsValidator do
  it 'takes an empty hash and returns hash of errors' do
    validator = OptionsValidator.new({})

    expect(validator.validate!.keys).to match_array([:filename, :to, :from])
  end

  it 'takes invalid time, returns hash of errors' do
    options = {
      from: 'invalidtimestring',
      to: 'invalidtimestring',
    }

    validator = OptionsValidator.new(options)
    expect(validator.validate!.keys).to match_array([:filename])
  end

  it 'takes no filename, returns hash of errors' do
    options = {
      from: 'invalidtimestring',
      to: 'invalidtimestring',
      filename: 'video.mp4'
    }

    validator = OptionsValidator.new(options)
    expect(validator.validate!.keys).to match_array([:from, :to])
  end

  it 'takes correct options, returns no errors at all' do
    options = {
      from: '1h1m1s',
      to: '1h1m2s',
      filename: 'video.mp4'
    }

    validator = OptionsValidator.new(options)
    expect(validator.validate!.keys).to match_array([])
  end
end
