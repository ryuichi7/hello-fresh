class SearchController < ApplicationController

	def new
		@search = Search.new(params[:query])
	end
end