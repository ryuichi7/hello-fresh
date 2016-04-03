require 'rails_helper'

RSpec.describe Translator, type: :model do

	describe 'translates' do 
		it "translates a slug" do
			translator = Translator.new(token)
			non_ascii = 'Jalapeno-chilli'
			country = "ES"
			expect(translator.translate(country, non_ascii)).to eq('Jalapeno-chilli')
		end
	end
end


