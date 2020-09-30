require 'sinatra'
require 'httparty'
require 'nokogiri'

set :port, 8080

def get_weather() 
  doc = HTTParty.get("https://www.gismeteo.ru/")
  page = Nokogiri::HTML(doc)
  string = ""
  string1 = ""
  page.xpath('//span[@class = "value unit unit_temperature_c"]').each do |el|
    string += el.text
  end
  page.xpath('//div[@class = "description gray"]').each do |el|
    string1 += el.text
  end
  string = string.split(' ')[0] + " " + string1.split(' ')[0]
  string
end

get '/' do
  get_weather()  
end
