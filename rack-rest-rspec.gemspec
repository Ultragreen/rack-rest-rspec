Gem::Specification.new do |spec|
  spec.name          = 'rack-rest-rspec'
  spec.version       = `cat VERSION`
  spec.authors       = ['Romain GEORGES']
  spec.email         = ['romain@ultragreen.net']
  spec.summary       = 'Rack-rest-rspec: RSpec Matchers for REST Rack webservice '
  spec.description   = 'Rack-rest-rspec: RSpec Matchers for REST Rack webservice '
  spec.homepage      = 'http://github.com/Ultragreen/rack-rest-rspec'
  spec.license       = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 3.2.3')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundle-audit', '~> 0.1.0'
  spec.add_development_dependency 'code_statistics', '~> 0.2.13'
  spec.add_development_dependency 'cyclonedx-ruby', '~> 1.1'
  spec.add_development_dependency 'debride', '~> 1.12'
  spec.add_development_dependency 'diff-lcs', '~> 1.5.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rubocop', '~> 1.32'
  spec.add_development_dependency 'sinatra', '~> 4.0'
  spec.add_development_dependency 'yard', '~> 0.9.28'
  spec.add_development_dependency 'yard-rspec', '~> 0.1'
  spec.add_runtime_dependency 'rack-test', '~> 2.0'
  spec.add_runtime_dependency 'version', '~> 1.1'
end
