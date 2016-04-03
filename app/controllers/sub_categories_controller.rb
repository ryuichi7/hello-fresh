class SubCategoriesController < ApplicationController

	def index
		@categories = SubCategory.order(:name).page(params[:page])
	end

	def show
		@category = SubCategory.find(params[:id])
	end
end
