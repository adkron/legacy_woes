require 'rubygems'
require 'active_record'
require '../lib/legacy_woes'

class Comment < ActiveRecord::Base
  created_at_column :createddate
end