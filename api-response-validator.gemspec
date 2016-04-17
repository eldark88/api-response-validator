# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api/response/validator/version'

Gem::Specification.new do |spec|
  spec.name          = "api-response-validator"
  spec.version       = Api::Response::Validator::VERSION
  spec.authors       = ["Eldar Khalyknazarov"]
  spec.email         = ["eldark88@gmail.com"]

  spec.summary       = %q{Simple gem to validate JSON API response.}
  spec.description   = %q{}
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["setup", "console", "api-response-validator"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "json-schema", "~> 2.6.0"
  spec.add_development_dependency "terminal-table", "~> 1.5.2"
  spec.add_development_dependency "rest-client", "~> 1.8.0"
end
