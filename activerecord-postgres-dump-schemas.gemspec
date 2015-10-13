# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activerecord-postgres-dump-schemas/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-postgres-dump-schemas"
  spec.version       = ActiveRecordPostgresDumpSchemas::VERSION
  spec.authors       = ["Nick Muerdter"]
  spec.email         = ["nick.muerdter@nrel.gov"]

  spec.summary       = %q{Define which PostgreSQL schemas to dump in your Rails db/structure.sql file}
  spec.homepage      = "https://github.com/GUI/activerecord-postgres-dump-schemas"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "< 5"
  spec.add_dependency "railties", "< 5"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
