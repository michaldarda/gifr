require_relative '../../lib/gifr/options_validator'

describe OptionsValidator do
  it 'takes an empty hash and returns hash of errors' do
    validator = OptionsValidator.new({})

    expect(validator.validate!.keys).to match_array([:filename, :start, :time])
  end

  it 'takes time, returns hash of errors' do
    options = {
      start: '00:00:01',
      time: '1',
    }

    validator = OptionsValidator.new(options)
    expect(validator.validate!.keys).to match_array([:filename])
  end

  it 'takes only filename, returns hash of errors' do
    options = {
      filename: 'video.mp4'
    }

    validator = OptionsValidator.new(options)
    expect(validator.validate!.keys).to match_array([:start, :time])
  end

  it 'takes correct options, returns no errors at all' do
    options = {
      start: '00:00:01',
      time: '1',
      filename: 'video.mp4'
    }

    validator = OptionsValidator.new(options)
    expect(validator.validate!.keys).to be_empty
  end
end
