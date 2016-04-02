class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :slug
      t.string :country
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
