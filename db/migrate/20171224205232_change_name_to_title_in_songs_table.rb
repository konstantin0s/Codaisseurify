class ChangeNameToTitleInSongsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :songs, :name, :title
  end
end
