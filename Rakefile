# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('legacy_woes', '0.1.1') do |p|
  p.description    = 'Tools for legacy databases and ActiveRecord'
  p.url            = 'http://github.com/adkron/legacy_woes'
  p.author         = 'Amos King'
  p.email          = 'amos.l.king@gmail.com'
  p.ignore_pattern = ['tmp/*', 'script/*', 'example.rb', 'test/*', 'init.rb', '*.gemspec']
  p.development_dependencies = []
end

Dir['#{File.dirname(__FILE__)}/tasks/*.rake'].sort.each