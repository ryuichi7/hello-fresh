class Ingredient < ActiveRecord::Base
	belongs_to :category
	has_many :ingredient_sub_categories
	has_many :sub_categories, through: :ingredient_sub_categories

	FOOD_DATABASE = SQLite3::Database.open "food_desc.db"

	def self.create_and_associate(row)
		ingredient = self.new(
			country: row[0],
			name: row[1],
			slug: row[2]
				)

		sql = <<-SQL
					SELECT * 
					FROM food_des
					Where Long_Desc like ?
				SQL

		database_matches = []

		if ingredient.name.include?(" ")
			ingredient.name.split(" ").each do |parsed_name|
				database_matches << FOOD_DATABASE.execute(sql, "%#{parsed_name}%")
			end
		else
			database_matches << FOOD_DATABASE.execute(sql, "%#{ingredient.name}%")
		end

		if !database_matches[0].empty?
			database_matches[0].each do |match|
				sub_category = SubCategory.find_by(food_group_id: match[1].to_i)
				if !ingredient.sub_categories.include?(sub_category)
					ingredient.ingredient_sub_categories.build(sub_category: sub_category)
				end
			end
		end

		ingredient.save

	end


end
