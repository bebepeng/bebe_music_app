require 'spec_helper'
require 'song_list'

describe SongList do
  before do
    DB[:songlist].delete
    @songlist = SongList.new(DB)
  end

  it "adds a song to the database" do
    @songlist.add("some_artist","some_title","some_language")
    expect(@songlist.all).to eq [{:artist => "some_artist", :title => "some_title", :language => "some_language"}]
  end
end