require 'uri' # opens a portal for our app
require 'net/http' # lets us go get data from portal
require 'json' # turns data into hash for our app

def format_request_and_send_api_call(search_term)
  giphy_request = "http://api.giphy.com/v1/gifs/search?q=#{search_term.gsub(" ","+")}&api_key=dc6zaTOxFJmzC"
  make_api_call(giphy_request)
end

def make_api_call(request_string)
  uri = URI(request_string) #open portal for app
  response = Net::HTTP.get(uri) #go get data
  formatted_data = JSON.parse(response) # turn data into something our app understands - a hash
 	formatted_data
  data = formatted_data["data"]
  return data.sample["images"]
end
















