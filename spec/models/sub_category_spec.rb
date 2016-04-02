require 'rails_helper'

RSpec.describe SubCategory, type: :model do
 	
 	let(:ingredient) { Ingredient.create(name: 'Cheese Curds', country: 'DE', slug: 'cheese-curds') }
	let(:category) { Category.create(name: 'dairy') }
	let(:sub_category) { SubCategory.create(name: "cow's milk") }

	describe 'attributes' do
		it 'has a name' do
			expect(sub_category.name).to eq("cow's milk")
		end
	end

	describe 'associations' do
		it 'belongs to a category' do
			sub_category.category = category
			sub_category.save
			expect(sub_category.category).to eq(category)
		end

		it 'has many ingredients' do
			sub_category.ingredients << ingredient
			sub_category.save
			expect(sub_category.ingredients).to include(ingredient)
		end
	end
end
