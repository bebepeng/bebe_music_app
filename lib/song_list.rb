class SongList
  def initialize(db)
   @songlist = db[:songlist]
  end

  def add(artist,title,language)
    @songlist.insert(:artist => artist, :title => title, :language => language)
  end

  def all
    @songlist.select(:artist, :title, :language).to_a
  end
end