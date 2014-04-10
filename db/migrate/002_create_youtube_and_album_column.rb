Sequel.migration do
  change do
    add_column :songlist, :album, String
    add_column :songlist, :youtube, String
  end
end