require 'rake'
require 'faraday'
require 'rspec'
require 'json'
require 'pry'
require 'webmock'

require_relative './owm/classes/client.rb'
require_relative './owm/classes/api.rb'
require_relative './owm/classes/portal.rb'
require_relative './owm/classes/response.rb'
require_relative './owm/classes/weather.rb'

module OWM
end

