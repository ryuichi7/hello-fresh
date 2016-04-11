require 'open-uri'
require 'csv'

namespace :importer do

	desc "creates sub_categories for ingredients"
	task create_sub_categories: :environment do

		path = Rails.root.join("lib/tasks/data/FD_GROUP.txt")

		File.readlines(path).each do |row|
			attrs = row.gsub(/~|\r\n/,"").split("^")
			SubCategory.create(
				name: attrs[1],
				food_group_id: attrs[0].to_i
				)
		end
	end

	desc "imports all ingredients"
	task import: [:environment, :create_sub_categories] do
		url = 'https://raw.githubusercontent.com/hackerstolz/foodhacks-apis/master/hellofresh/data-challenge/ingredients.csv'
		translator = Translator.new('trnsl.1.1.20160402T123102Z.27bf941382b9c95e.473150282c5bf55944ef7f1c5055fe251898bb68')
		Importer.new(url, translator).import

	end
end


# if ingredient is included in description after splitting
# assign that category to self and take description, omit self and add others as sub categories








