class CreateMangas < ActiveRecord::Migration[6.0]
  def change
    create_table :mangas do |t|
      t.integer :views_count
      t.integer :author_id
      t.text :status
      t.integer :user_id
      t.text :banner_img
      t.text :description

      t.timestamps
    end
  end
end
