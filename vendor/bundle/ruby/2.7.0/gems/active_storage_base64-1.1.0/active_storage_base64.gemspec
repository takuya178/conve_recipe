Gem::Specification.new do |s|
  s.name = 'active_storage_base64'
  s.version = '1.1.0'
  s.summary = 'Base64 support for ActiveStorage'
  s.description = s.summary

  s.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.require_paths = ['lib']
  s.authors = ['Ricardo Cortio']
  s.license = 'MIT'
  s.homepage = 'https://github.com/rootstrap/active-storage-base64'
  s.email = 'ricardo@rootstrap.com'

  s.required_ruby_version = '>= 2.2.2'

  # Dependencies
  s.add_dependency 'rails', '~> 6.0'

  # Development dependencies
  s.add_development_dependency 'pry-rails', '~> 0.3.6'
  s.add_development_dependency 'reek', '~> 5.5.0'
  s.add_development_dependency 'rspec-rails', '~> 3.8.0'
  s.add_development_dependency 'rubocop', '~> 0.56.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3', '1.4.1'
end
