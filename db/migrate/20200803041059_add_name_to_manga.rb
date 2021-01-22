class AddNameToManga < ActiveRecord::Migration[6.0]
  def change
    add_column :mangas, :name, :string
  end
end
