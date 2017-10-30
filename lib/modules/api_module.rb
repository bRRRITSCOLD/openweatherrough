require 'yaml'

module API_KEY

	def api_key_loader
		if File.exist?(File.expand_path('../api_key.yml', __FILE__))
			ENV.update YAML.load(File.read(File.expand_path('../api_key.yml', __FILE__)))
		elsif File.exist?(File.expand_path('../api.yml', __FILE__))
			ENV.update YAML.load(File.read(File.expand_path('../api.yml', __FILE__)))
		else
			ENV.update YAML.load(File.read(File.expand_path('../test.yml', __FILE__)))
		end
	end
end