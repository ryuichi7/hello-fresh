require 'open-uri'
require 'csv'

namespace :sub_category do

	desc "creates sub_categories for ingredients"

	task create: :environment do

		path = Rails.root.join("lib/tasks/data/FD_GROUP.txt")

		File.readlines(path).each do |row|
			attrs = row.gsub(/~|\r\n/,"").split("^")
			SubCategory.create(
				name: attrs[1],
				food_group_id: attrs[0].to_i
				)
		end

	end
end