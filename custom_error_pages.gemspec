# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'custom_error_pages/version'

Gem::Specification.new do |s|
  s.name        = 'custom_error_pages'
  s.version     = CustomErrorPages::VERSION
  s.authors     = ['Alexander Stanko']
  s.email       = ['astanko@aviasales.ru']
  s.homepage    = ''
  s.summary     = %q{Show dynamic error pages for 404 and 500 errors}
  s.description = %q{Created from this gist: https://gist.github.com/1563416}

  s.rubyforge_project = 'custom_error_pages'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  # s.add_development_dependency 'rspec'
  # s.add_runtime_dependency 'rest-client'
end
