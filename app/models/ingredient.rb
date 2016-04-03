class Ingredient < ActiveRecord::Base
	belongs_to :category
	has_many :ingredient_sub_categories
	has_many :sub_categories, through: :ingredient_sub_categories
	validates :name, uniqueness: true

	FOOD_DATABASE = SQLite3::Database.open "food_desc.db"
	EXCEPTIONS = "paste, filet, fillet, fillets, steak, steaks, skewer, fresh, 
		stock, pot, a, and, an, the, on, in, with, chop, chops, chopped, gem, green,
		yellow, blue, red, new, slivered, sauce, smokey, smoked, rub, half, blend, wine, 
		stick, pearl, precooked, sweet, purple, ground, breast, skinless, loin, roll, rolls, 
		snow, long, short, mix, inch, glass, jar, wooden, lite, light, hard, roaming, d, o, p, seed, seeds"
	
	SQL = <<-SQL
					SELECT * 
					FROM food_des
					Where Long_Desc like ?
				SQL

	def self.create_and_associate(row, translator)
		ingredient = self.new(
			country: row[0],
			name: row[1],
			slug: row[2]
				)
		eng_slug = ingredient.country.length > 2 ? ingredient.slug : translator.translate(ingredient.country, ingredient.slug)
		puts eng_slug
		database_matches = category_matches(eng_slug, SQL)
		associate(database_matches, ingredient)
		

	end

	def self.category_matches(name, sql)
		if name.include?("-")
			name.split("-").map do |parsed_name|
				FOOD_DATABASE.execute(sql, "%#{parsed_name}%") unless EXCEPTIONS.include?(parsed_name.downcase)
			end[0]
		else
			FOOD_DATABASE.execute(sql, "%#{name}%")
		end	
	end	

	def self.associate(database_matches, ingredient)
		if !database_matches.blank?
			database_matches.each do |match|
				sub_category = SubCategory.find_by(food_group_id: match[1].to_i)
				if !ingredient.sub_categories.include?(sub_category)
					ingredient.ingredient_sub_categories.build(sub_category: sub_category)
					ingredient.save
				end
			end
		end
	end

	def self.search_by_name(query)
		where('name like ?', "%#{query}%")
	end

end
