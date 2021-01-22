class CreateMangaCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :manga_categories do |t|
      t.integer :manga_id
      t.integer :category_id

      t.timestamps
    end
  end
end
