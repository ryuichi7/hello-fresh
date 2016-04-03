class IngredientsController < ApplicationController

	def index
		if params[:ingredient]
			results = Ingredient.search_by_name(params[:ingredient])
			@ingredients = results.order(:name).page(params[:page])
		else
			@ingredients = Ingredient.order(:name).page(params[:page])
		end
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end


end
