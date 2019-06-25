# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mercado_pago/version"

Gem::Specification.new do |spec|
  spec.name          = "mercado_pago"
  spec.version       = MercadoPago::VERSION
  spec.authors       = ["Djair Carvalho"]
  spec.email         = ["djaircarvalho.dj7@gmail.com"]

  spec.summary       = %q{A simple gem to cover Mercado Pago's advanced payment.}
  spec.description   = %q{None of current gems cover advanced payments, so here we go.}
  spec.homepage      = "https://github.com/djaircarvalho/mercado_pago"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 1.9.3'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/djaircarvalho/mercado_pago"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "virtus", "~> 1.0.5"
  spec.add_dependency "virtus_convert"
  spec.add_dependency "blanket_wrapper"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "debugger"

end
