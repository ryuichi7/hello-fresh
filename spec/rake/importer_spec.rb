require 'rails_helper'

RSpec.describe Importer, type: :model do

	let(:sample) {[["BE", "Limoen", "limoen"], ["BE", "Gele cherrytomaten", "gele-cherrytomaten"], ["AU", "radishes", "radishes"], 
		["US", "Red Cabbage", "red-cabbage"], ["US", "Snow Peas", "snow-peas"], ["US", "Cashews (tree nuts)", "cashews-tree-nuts"], ["US", "Shredded Unsweetened Coconut (Tree Nuts)", "shredded-unsweetened-coconut-tree-nuts"], 
		["US", "Macadamia Nuts", "macadamia-nuts"], ["US", "Macadamia Nuts (nuts)", "macadamia-nuts-nuts"], ["NL", "Desembaguette", "desembaguette"], 
		["NL", "Pruimtomaten", "pruimtomaten"], ["NL", "Ijsbergsla", "ijsbergsla"], ["NL", "Koolrabi", "koolrabi"], ["NL", "Kipfiletreepjes", "kipfiletreepjes"], 
		["NL", "Babyspinazie", "babyspinazie"], ["NL", "Gigli", "gigli"], ["NL", "Parmigiano Reggiano", "parmigiano-reggiano"], ["BE", "Sperziebonen", "sperziebonen"], 
		["BE", "Desembaguette", "desembaguette"], ["BE", "Pruimtomaten", "pruimtomaten"], ["BE", "Ijsbergsla", "ijsbergsla"], ["BE", "Warmgerookte makreel", "warmgerookte-makreel"], 
		["BE", "Volkoren bulgur", "volkoren-bulgur"]]}

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
	end
end