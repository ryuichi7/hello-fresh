class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :ingredient_sub_categories
	has_many :ingredients, through: :ingredient_sub_categories
end
