# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "megam/assembla/version"

Gem::Specification.new do |s|
  s.name        = "megam_assembla"
  s.version     = Megam::Assembla::VERSION
  s.authors     = ["Kishorekumar Neelamegam, Thomas Alrin,  Rajthilak"]
  s.email       = ["nkishore@megam.co.in","alrin@megam.co.in", "rajthilak@megam.co.in"]
  s.homepage    = "http://github.com/megamsys/megam_assembla_api.git"
  s.license = "Apache V2"
  sextra_rdoc_files = ["README.md", "LICENSE" ]
  s.summary = %q{Ruby Client for the Assembla}
  s.description = %q{Ruby Client for the Assembla. Performs REST based HTTP calls to api.assembla.com using OAuth2}
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency 'excon', '~> 0.31'
  s.add_runtime_dependency 'yajl-ruby', '~> 1.2'
  s.add_runtime_dependency 'mixlib-log', '~> 1.6'
  s.add_development_dependency 'minitest', '~> 5.2'
  s.add_development_dependency 'rake', '~> 10.1'
  s.add_runtime_dependency 'megam_api', '~> 0.10'
end
