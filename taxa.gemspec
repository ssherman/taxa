# frozen_string_literal: true

require_relative 'lib/taxa/version'

Gem::Specification.new do |spec|
  spec.name          = 'taxa'
  spec.version       = Taxa::VERSION
  spec.authors       = ['Shane Sherman']
  spec.email         = ['shane.sherman@gmail.com']

  spec.summary       = 'Wrapper around a bunch of taxonomy databases.'
  spec.description   = 'Wrapper around a bunch of taxonomy databases.'
  spec.homepage      = 'https://github.com/ssherman/taxa'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ssherman/taxa'
  spec.metadata['changelog_uri'] = 'https://github.com/ssherman/taxa/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'rubocop', '~> 1.6'
  spec.add_dependency 'faraday', '~> 1.1'
end
