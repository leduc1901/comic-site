class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.integer :manga_id
      t.text :content
      t.integer :page_size

      t.timestamps
    end
  end
end
