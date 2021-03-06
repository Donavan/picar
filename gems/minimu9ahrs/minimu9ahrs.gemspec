# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minimu9ahrs/version'

Gem::Specification.new do |spec|
  spec.name          = 'minimu9ahrs'
  spec.version       = Minimu9ahrs::VERSION
  spec.authors       = ['donavan']
  spec.email         = ['donavan.stanley@gmail.com']

  spec.summary       = %q{Ruby gem for reading data from the Pololu MinIMU-9 over I²C.}
  spec.description   = %q{This gem provides bindings for the minimu9-ahrs project.}
  spec.homepage      = 'https://github.com/Donavan/picar/tree/master/gems/minimu9ahrs'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions    = ['ext/minimu9ahrs/extconf.rb']

  spec.add_development_dependency 'bundler',        '~> 1.10'
  spec.add_development_dependency 'rake',           '~> 10.0'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'

  spec.add_dependency 'rice', '~> 1.7'
end
