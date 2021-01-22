class CreateSubcribes < ActiveRecord::Migration[6.0]
  def change
    create_table :subcribes do |t|
      t.references :manga, index: true 
      t.references :user, index: true 

      t.timestamps
    end
  end
end
