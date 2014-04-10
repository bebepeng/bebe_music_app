require 'spec_helper'
require 'song_list'

describe SongList do
  before do
    DB[:songlist].delete
    @songlist = SongList.new(DB)
  end

  it "adds a song to the database" do
    id = @songlist.add("some_artist", "some_title", "some_language", "", "")
    expect(@songlist.all).to eq [{:id => id, :artist => "some_artist", :title => "some_title", :language => "some_language", :album => nil, :youtube => nil}]
  end

  it "edits a song's attributes" do
    id = @songlist.add("some_artist", "some_title", "some_language","","")
    @songlist.edit(id, {:artist => "other_artist"})
    expect(@songlist.all).to eq [{:id => id, :artist => "other_artist", :title => "some_title", :language => "some_language", :album => nil, :youtube => nil}]
  end

  it "gets a song's attributes" do
    id = @songlist.add("some_artist", "some_title", "some_language","some_album", "some_link")
    expect(@songlist.get_artist(id)).to eq "some_artist"
    expect(@songlist.get_title(id)).to eq "some_title"
    expect(@songlist.get_language(id)).to eq "some_language"
    expect(@songlist.get_album(id)).to eq "some_album"
    expect(@songlist.get_youtube(id)).to eq "some_link"
  end
end