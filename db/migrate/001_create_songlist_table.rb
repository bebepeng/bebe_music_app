Sequel.migration do
  up do
    create_table(:songlist) do
      primary_key :id
      String :artist
      String :title
      String :language
    end
  end

  down do
    drop_table(:urls)
  end
end