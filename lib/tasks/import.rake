require 'open-uri'
require 'csv'

namespace :importer do
	desc "imports ingredients from csv"
	task ingredients: :environment do
		csv = CSV.read(open('https://raw.githubusercontent.com/hackerstolz/foodhacks-apis/master/hellofresh/data-challenge/ingredients.csv'))
		
		csv.each do |row| 
			Ingredient.create(
				country: row[0],
				name: row[1],
				slug: row[2]
			)
		end
	end
end
