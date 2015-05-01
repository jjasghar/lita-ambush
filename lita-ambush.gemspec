Gem::Specification.new do |spec|
  spec.name          = "lita-ambush"
  spec.version       = "1.0.3"
  spec.authors       = ["JJ Asghar","Chris Baker","Greg Kitson"]
  spec.email         = ["jjasghar@gmail.com","dosman711@gmail.com","greg.kitson@gmail.com"]
  spec.description   = %q{Allow lita to ambush your users}
  spec.summary       = %q{Allow lita store ambushs for your users, so you can leave messages in the chats for later}
  spec.homepage      = "http://github.com/jjasghar/lita-ambush"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
end
