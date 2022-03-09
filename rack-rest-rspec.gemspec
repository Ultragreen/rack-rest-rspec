# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "rack-rest-rspec"
  spec.version       = "0.0.1"
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

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.1'
  spec.add_development_dependency 'yard', '~> 0.8', '>= 0.8.7.2'
  spec.add_development_dependency 'rdoc', '~> 4.0', '>= 4.0.1'
  spec.add_development_dependency 'roodi', '~> 3.1', '>= 3.1.1'
  spec.add_development_dependency 'code_statistics', '~> 0.2', '>= 0.2.13'
  spec.add_development_dependency 'yard-rspec', '~> 0.1'
  spec.add_runtime_dependency "rack-test", "~> 0.6", ">= 0.6.3"	


end
