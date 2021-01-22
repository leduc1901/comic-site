class AddDefaultStatusManga < ActiveRecord::Migration[6.0]
  def change
    change_column :mangas , :status , :string, default: "ongoing"
  end
end
