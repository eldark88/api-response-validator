require_relative "./validator/version"
require "json-schema"
require "json"
require "terminal-table"
require "rest-client"

module Api
  module Response
    module Validator
    	class Validator
    		def initialize(config_data)
    			@config_data = config_data
    			@username = config_data['authentication']['username']
    			@password = config_data['authentication']['password']
    		end

    		def validate_all
    			urls = @config_data['urls']
    			rows = []
    			has_failure = false

    			for url_data in urls do
    				url = url_data['url']
    				schema = url_data['schema']
    				result = 'OK'
    				data = fetch_json(url)

    				begin
    				  JSON::Validator.validate!(schema, data)
    				rescue JSON::Schema::ValidationError => e
    				  result = e.message
    					has_failure = true
    				end

    				rows << [url_data['url'], result]
    			end

    			table = Terminal::Table.new :headings => ['URL', 'Result'], :rows => rows

    			puts table

    			if has_failure
    				exit(-1)
    			end
    		end

    		private def fetch_json(url)
    			return RestClient::Request.execute method: :get, url: url, user: @username, password: @password
    		end

    	end
    end
  end
end
