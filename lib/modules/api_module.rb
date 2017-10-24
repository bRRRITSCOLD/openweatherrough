require 'yaml'

module API_KEY

	def api_key_loader
		ENV.update YAML.load(File.read(File.expand_path('../api.yml', __FILE__)))
	end

end