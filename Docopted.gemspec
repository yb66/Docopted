lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Docopted"
  spec.version       = "0.1.0"
  spec.authors       = ["iain barnett"]
  spec.email         = ["helpful-iain@theprintedbird.com"]

  spec.summary       = %q{Objectify the options parsed by Docopt}
  spec.files         = ["lib/Docopted.rb",
"lib/Docopted/version.rb", "LICENCE", "README.md", "Gemfile", "Docopted.gemspec"]
  spec.require_paths = ["lib"]

  spec.add_dependency "docopt"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "rspec-given"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rspec", "~> 3.0"
end
