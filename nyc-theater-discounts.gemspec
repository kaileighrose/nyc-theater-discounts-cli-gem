# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyc/theater/discounts/version'

Gem::Specification.new do |spec|
  spec.name          = "nyc-theater-discounts"
  spec.version       = Nyc::Theater::Discounts::VERSION
  spec.authors       = ["Kaileigh McCrea"]
  spec.email         = ["kaileighrose@gmail.com"]

  spec.summary       = %q{Shows daily discounts for NYC theater tickets}
  spec.description   = %q{Aggregates up-to-the-minute discounts for theater tickets in New York City.}
  spec.homepage      = "https://github.com/kaileighrose/nyc-theater-discounts-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
end
