class AddChapterName < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :name, :string
  end
end
