module OWM
 class Weather

	attr_accessor :longitude, :lattitude, :conditions, :temperature, :atmospheric_pressure, :humidity, :minimum_temperature, :maximum_temperature, :visibility, :wind_speed, :wind_degree, :cloud_coverage, :city_name, :country_code, :code, :sunrise, :sunset

	def initialize(json={})
		@longitude = json['coord']['lon'] 
		@lattitude = json['coord']['lat'] 
		@conditions = json['weather'][0]['description']
		@temperature = json['main']['temp']
		@atmospheric_pressure = json['main']['pressure'] 
		@humidity = json['main']['humidity']
		@minimum_temperature = json['main']['temp_min'] 
		@maximum_temperature = json['main']['temp_max']
		@visibility = json['visibility']
		@wind_speed = json['wind']['speed']
		@wind_degree = json['wind']['deg']
		@cloud_coverage = json['clouds']['all']
		@city_name = json['name']
		@country_code = json['sys']['country']
		@code = json['cod']
		@sunrise = json['sys']['sunrise']
		@sunset = json['sys']['sunset']
	end

 end
end
