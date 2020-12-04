class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cook_time
      t.integer :user_id
      t.integer :cuisine_id
      t.timestamps null: false
    end
  end
end
