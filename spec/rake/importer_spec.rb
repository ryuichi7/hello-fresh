require 'rails_helper'

RSpec.describe Importer, type: :model do

let(:sub_category) { SubCategory.new()}


	describe 'importer' do
		it 'properly imports data' do
			path = Rails.root.join("lib/tasks/data/test.csv") 
			importer = Importer.new(path)
			expect(importer.data.first).to eq(["country", "name", "slug"])
		end

		it 'creates ingredients' do
			path = Rails.root.join("lib/tasks/data/test.csv")
			importer = Importer.new(path)
			importer.import
			expect(Ingredient.second.name).to eq("Chicken Breast") 
		end 

		it 'makes associations' do

	end
end