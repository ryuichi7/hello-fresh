namespace :category do

	
	desc "create categories"
	task create: :environment do
		categories = %w[ meat dairy vegetables fruits carbohydrates]

		categories.each { |category| Category.create(name: category) }

	end
end