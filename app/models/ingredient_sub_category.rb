class IngredientSubCategory < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :sub_category
end
