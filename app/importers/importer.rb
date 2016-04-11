require 'open-uri'
require 'csv'

class Importer 
	attr_accessor :path, :translator

	def initialize(path, translator = nil)
		@path = path
		@translator = translator
	end

	def data
		new_path = path.is_a?(String) ? open(path) : path
		CSV.read(new_path)
	end

	def import
		data.each { |row| Ingredient.create_and_associate(row, translator) }
	end
end
