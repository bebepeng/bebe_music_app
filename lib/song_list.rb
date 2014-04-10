class SongList
  def initialize(db)
   @songlist = db[:songlist]
  end

  def add(artist,title,language)
    @songlist.insert(:artist => artist, :title => title, :language => language)
  end

  def edit(id, changes)
    @songlist.where(:id => id).update(changes)
  end

  def get_artist(id)
    @songlist[:id => id][:artist]
  end

  def get_title(id)
    @songlist[:id => id][:title]
  end

  def get_language(id)
    @songlist[:id => id][:language]
  end

  def all
    @songlist.to_a
  end
end