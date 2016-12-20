Gem::Specification.new do |spec|
  spec.name = "ruboty-treasure_data"
  spec.version = "0.1.0"
  spec.authors = ["Naoto Kaneko"]
  spec.email = ["naoty.k@gmail.com"]
  spec.summary = "Manage Treasure Data via Ruboty."
  spec.homepage = "https://github.com/naoty/ruboty-treasure_data"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "td-client"
  spec.add_dependency "terminal-table"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
