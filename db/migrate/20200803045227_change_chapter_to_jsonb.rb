class ChangeChapterToJsonb < ActiveRecord::Migration[6.0]
  def change
    change_column :chapters , :content , 'text USING content::jsonb'
  end
end
