require 'rails_helper'

RSpec.describe Ingredient, type: :model do

	let(:ingredient) { Ingredient.create(name: 'Cheese Curds', country: 'DE', slug: 'cheese-curds') }
	let(:category) { Category.create(name: 'dairy') }
	let(:sub_category) { SubCategory.create(name: "cow's milk") }

  describe 'attributes' do
  	it 'has a name' do
  		expect(ingredient.name).to eq('Cheese Curds')
  	end

  	it 'has a slug' do 
  		expect(ingredient.slug).to eq('cheese-curds')
  	end

  	it 'has a country' do
  		expect(ingredient.country).to eq('DE')
  	end
  end

  describe 'associations' do
  	it 'belongs to category' do
  		ingredient.category = category
  		ingredient.save
  		expect(ingredient.category).to eq category
  	end

  	it 'has many sub_categories' do
  		ingredient.sub_categories << sub_category
  		ingredient.save
  		expect(ingredient.sub_categories).to include(sub_category)
  	end
  end
end
