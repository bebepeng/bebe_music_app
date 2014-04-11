require 'spec_helper'
require 'youtube_validator'

describe YoutubeValidator do
  it "recognizes a youtube link" do
    expect(YoutubeValidator.valid?('https://www.youtube.com/watch?v=dQw4w9WgXcQ')).to eq true
    expect(YoutubeValidator.valid?('http://youtu.be/dQw4w9WgXcQ')).to eq true
    expect(YoutubeValidator.valid?('http://www.youtube.com/v/dQw4w9WgXcQ')).to eq true
  end

  it "recognizes a non youtube link" do
    expect(YoutubeValidator.valid?('blah')).to eq false
    expect(YoutubeValidator.valid?(0)).to eq false
    expect(YoutubeValidator.valid?('')).to eq false
    expect(YoutubeValidator.valid?('http://google.com')).to eq false
    expect(YoutubeValidator.valid?('youtube')).to eq false
  end

  it "formats youtube links" do
    expect(YoutubeValidator.make_useable('https://www.youtube.com/watch?v=dQw4w9WgXcQ')).to eq 'https://www.youtube.com/v/dQw4w9WgXcQ'
    expect(YoutubeValidator.make_useable('http://youtu.be/dQw4w9WgXcQ')).to eq 'https://www.youtube.com/v/dQw4w9WgXcQ'
    expect(YoutubeValidator.make_useable('http://www.youtube.com/v/dQw4w9WgXcQ')).to eq 'http://www.youtube.com/v/dQw4w9WgXcQ'
  end
end