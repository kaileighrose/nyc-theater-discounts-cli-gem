# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyc_theater_discounts/version'

Gem::Specification.new do |spec|
  spec.name          = "nyc-theater-discounts"
  spec.version       = NYCTheaterDiscounts::VERSION
  spec.authors       = ["Kaileigh McCrea"]
  spec.email         = ["kaileighrose@gmail.com"]

  spec.summary       = %q{Shows daily discounts for NYC theater tickets}
  spec.description   = %q{Aggregates up-to-the-minute discounts for theater tickets in New York City.}
  spec.homepage      = "https://github.com/kaileighrose/nyc-theater-discounts-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["nyc-theater-discounts"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "rspec", ">= 0"
end
