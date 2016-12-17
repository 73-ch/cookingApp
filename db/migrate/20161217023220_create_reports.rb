class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
