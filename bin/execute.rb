require_relative "../lib/owm.rb"

options = {consumer_api_key: "XXXXXXXXXXXXXXXXXXXXXX"}
params = {appid: options[:consumer_api_key, q: 'XXXXXXX', units: 'XXXXXXXXXXX'} 

client = OWM::Client.new(options)
apii = client.api.new(params)
apii.get_weather
weatherr = apii.response.weather
puts "\n\n\n\n\n\n\n\nThe current temperature in #{weatherr.city_name}, #{weatherr.country_code} is #{weatherr.temperature}\n\n\n\n\n\n\n\n\n\n"