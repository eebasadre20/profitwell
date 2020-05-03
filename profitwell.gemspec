require_relative 'lib/profitwell/version'

Gem::Specification.new do |spec|
  spec.name          = "profitwell"
  spec.version       = Profitwell::VERSION
  spec.authors       = ["eebasadre20"]
  spec.email         = ["eebasadre20@gmail.com"]

  spec.summary       = "Profitwell Ruby API Wrapper"
  spec.description   = "Profitwell Ruby API Wrapper"
  spec.homepage      = "https://github.com/eebasadre20/profitwell"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["homepage_uri"] = "https://github.com/eebasadre20/profitwell"
  spec.metadata["source_code_uri"] = "https://github.com/eebasadre20/profitwell"
  spec.metadata["changelog_uri"] = "https://github.com/eebasadre20/profitwell/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
