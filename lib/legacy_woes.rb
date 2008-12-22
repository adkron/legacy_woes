# Get rid of some of the legacy database woes
#
# Author::    Amos King  (mailto:amos.l.king@gmail.com)
# Copyright:: Copyright (c) 2008 Amos King
# License::   Released under the MIT license


module LegacyWoes
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    # Sets the created_at column.
    # Also defines methods for created_at and created_at=.
    def created_at_column(legacy_column_name)
      module_eval <<-EOB
        def write_attribute_with_#{legacy_column_name}_created_at(name, value, &block)
          if name == 'created_at'
            write_attribute('#{legacy_column_name}', value)
          else
            send(:write_attribute_without_#{legacy_column_name}_created_at, name, value, &block)
          end
        end
        EOB
      
      alias_attribute :created_at, legacy_colun_name
      alias_method_chain :write_attribute, "#{legacy_column_name}_created_at"
    end
    
    # Sets the updated_at column.
    # Also defines methods for updated_at and updated_at=.
    def updated_at_column(legacy_column_name)
      module_eval <<-EOB
        def write_attribute_with_#{legacy_column_name}_updated_at(name, value, &block)
          if name == 'updated_at'
            write_attribute('#{legacy_column_name}', value)
          else
            send(:write_attribute_without_#{legacy_column_name}_updated_at, name, value, &block)
          end
        end
        EOB
         
      alias_attribute :updated_at, legacy_colun_name
      alias_method_chain :write_attribute, "#{legacy_column_name}_updated_at"
    end
  end
end

class ActiveRecord::Base
  include LegacyWoes
end

