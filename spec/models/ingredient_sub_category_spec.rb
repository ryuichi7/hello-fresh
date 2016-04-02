require 'rails_helper'

RSpec.describe IngredientSubCategory, type: :model do

	let(:ingredient) { Ingredient.create(name: 'Cheese Curds', country: 'DE', slug: 'cheese-curds') }
	let(:category) { Category.create(name: 'dairy') }
	let(:sub_category) { SubCategory.create(name: "cow's milk") }
	let(:ingredient_sub_category) { IngredientSubCategory.new }
  
	describe 'associations' do

  	it 'belongs to a sub_category' do
  		ingredient_sub_category.sub_category = sub_category
  		ingredient_sub_category.save
  		expect(ingredient_sub_category.sub_category).to eq(sub_category)
  	end

  	it 'belongs to an ingredient' do
  		ingredient_sub_category.ingredient = ingredient
  		ingredient_sub_category.save
  		expect(ingredient_sub_category.ingredient).to eq(ingredient)
  	end
  end
end
