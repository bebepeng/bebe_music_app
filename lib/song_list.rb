class SongList
  def initialize(db)
   @songlist = db[:songlist]
  end

  def add(*inputs)
    inputs.map! do |attribute|
      if attribute.empty?
        nil
      else
        attribute
      end
    end
    @songlist.insert(:artist => inputs[0], :title => inputs[1], :language => inputs[2], :album => inputs[3], :youtube => inputs[4])
  end

  def edit(id, changes)
    changes.each do |key, value|
      if value.empty?
        changes[key] = nil
      end
    end
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

  def get_album(id)
    @songlist[:id => id][:album]
  end

  def get_youtube(id)
    @songlist[:id => id][:youtube]
  end

  def all
    @songlist.to_a
  end
end