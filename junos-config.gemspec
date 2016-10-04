# coding: utf-8

Gem::Specification.new do |s|
  s.name = %q{junos-config}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Wulff", "Jason Scholl"]
  s.description = %q{Parser for Junos (Juniper network gear OS) config files.}
  s.email = %q{johnw@orcasnet.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage = %q{http://github.com/jescholl/junos-config}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = %q{Parser for Junos config files.}

  s.add_development_dependency "rspec", "~> 3.3"
  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "pry", "~> 0.10"
end
