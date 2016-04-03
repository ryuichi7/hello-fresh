class Search
	attr_accessor :query

	def initialize(query)
		@query = query
	end

	def results
		Ingredient.sub_category_search(@query)
	end
end

