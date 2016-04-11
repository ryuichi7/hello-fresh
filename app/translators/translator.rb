require 'httparty'
require 'pry'

class Translator
	attr_accessor :token

	BASE_URL = 'https://translate.yandex.net/api/v1.5/tr/translate?'

	def initialize(token)
		@token = token
	end


	def translate(country_code, text)
		encoded = text.encode('ASCII', :invalid => :replace, :undef => :replace)
		url = BASE_URL + "key=#{token}&text=#{encoded}&lang=#{country_code.downcase}-en"
		
		response = HTTParty.post(url)
		response['Error'] ? text : get_text(HTTParty.post(url))
			
	end

	def get_text(response)
		response.parsed_response["Translation"]["text"]
	end
 
end

