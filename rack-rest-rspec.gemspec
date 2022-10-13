# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "rack-rest-rspec"
  spec.version       = `cat VERSION`
  spec.authors       = ["Romain GEORGES"]
  spec.email         = ["romain@ultragreen.net"]
  spec.summary       = %q{Rack-rest-rspec: RSpec Matchers for REST Rack webservice }
  spec.description   = %q{Rack-rest-rspec: RSpec Matchers for REST Rack webservice }
  spec.homepage      = "http://github.com/Ultragreen/rack-rest-rspec"
  spec.license       = "BSD-2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "roodi", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "code_statistics", "~> 0.2.13"
  spec.add_development_dependency "rspec", "~> 3.11"
  spec.add_development_dependency "yard", "~> 0.9.28"
  spec.add_development_dependency "yard-rspec", "~> 0.1"
  
  spec.add_runtime_dependency "rack-test", "~> 2.0"


end
