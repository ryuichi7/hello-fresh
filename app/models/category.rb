class Category < ActiveRecord::Base
	has_many :ingredients
	has_many :sub_categories
end
