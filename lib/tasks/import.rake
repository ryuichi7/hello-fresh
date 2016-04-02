require 'open-uri'
require 'csv'

namespace :importer do
	
	desc "imports ingredients from csv"
	task ingredients: :environment do
		
		csv = CSV.read(open('https://raw.githubusercontent.com/hackerstolz/foodhacks-apis/master/hellofresh/data-challenge/ingredients.csv'))
		@connection = ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => 'food_desc.db')
		
		csv.each do |row| 
			ingredient = Ingredient.create(
				country: row[0],
				name: row[1],
				slug: row[2]
			)
			sql = <<-SQL
				SELECT * 
				FROM food_des
				Where Long_Desc like ?
			SQL
			
			database_matches = @connection.connection(sql, "%#{ingredient.name}%")


			if !database_matches.empty?
				database_matches.each do |match|
					sub_category = SubCategory.find_or_create_by(food_group_id: match["FdGrp_Cd"].to_i)
					if !ingredient.sub_categories.include?(sub_category)
						ingredient.ingredient_sub_categories.build(category: sub_category)
					end
				end
			end


		end
	end

	desc 'imports usda ingredient descriptions'
	task foods: :environment do
		# path = Rails.root.join("lib/tasks/data/FOOD_DES.txt")
		# File.readlines(path).each do |row|
		# 	new_row = row.split('^')
		# 	newer = new_row.map { |column| column.gsub('~', "" )}
		# 	puts newer.inspect 
		# end
		@connection = ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => 'food_desc.db')
		sql = 'select * from food_des'
		food_array = @connection.connection.execute(sql).inspect
		puts food_array[0]
	end

	desc "imports all ingredients"
	task import: :environment do
		url = 'https://raw.githubusercontent.com/hackerstolz/foodhacks-apis/master/hellofresh/data-challenge/ingredients.csv'

		importer = Importer.new(url)
		importer.import

	end
end





# if ingredient is included in description after splitting
# 	assign that category to self and take description, omit self and add others as sub categories
# 








