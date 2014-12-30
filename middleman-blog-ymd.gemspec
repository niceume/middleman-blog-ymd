# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-blog-ymd/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-blog-ymd"
  spec.version       = MiddlemanBlogYmd::VERSION
  spec.authors       = ["niceume"]
  spec.email         = ["toshi@niceume.com"]
  spec.summary       = %q{years months days (for middleman-blog).}
  spec.description   = %q{years months days support for middleman-blog.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "middleman-blog"
end


