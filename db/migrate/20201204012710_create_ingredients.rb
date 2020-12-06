class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :amount
      t.string :unit_type
      t.integer :recipe_id
      t.timestamps null: false
    end
  end
end
