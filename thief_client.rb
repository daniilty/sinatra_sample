require 'json' 
require 'rest-client' 

response = RestClient.get 'http://localhost:8080'
puts response
