require 'rubygems'
require 'test/unit'
require 'active_record'
require File.dirname(__FILE__) + '/../lib/legacy_woes'
config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config[ENV['DB'] || 'sqlite3'])
# load schema file
load(File.dirname(__FILE__) + "/schema.rb") if File.exist?(File.dirname(__FILE__) + "/schema.rb")

class Comment < ActiveRecord::Base
  created_on_column :dateSubmitted
  updated_on_column :dateUpdated
  created_at_column :timeSubmitted
  updated_at_column :timeUpdated
end