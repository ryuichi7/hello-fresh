class CreateIngredientSubCategories < ActiveRecord::Migration
  def change
    create_table :ingredient_sub_categories do |t|
      t.integer :ingredient_id
      t.integer :sub_category_id

      t.timestamps null: false
    end
  end
end
