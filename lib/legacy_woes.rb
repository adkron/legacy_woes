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
      setup_legacy_method(legacy_column_name, :created_at)
    end
    
    # Sets the updated_at column.
    # Also defines methods for updated_at and updated_at=.
    def updated_at_column(legacy_column_name)
      setup_legacy_method(legacy_column_name, :updated_at)
    end
    
    # Sets the created_on column.
    # Also defines methods for created_on and created_on=.
    def created_on_column(legacy_column_name)
      setup_legacy_method(legacy_column_name, :created_on)
    end
    
    # Sets the updated_on column.
    # Also defines methods for updated_on and updated_on=.
    def updated_on_column(legacy_column_name)
      setup_legacy_method(legacy_column_name, :updated_on)
    end
    
    def setup_legacy_method(legacy_column_name, replacement_column)
      module_eval <<-EOB
        def write_attribute_with_#{legacy_column_name}_#{replacement_column}(name, value, &block)
          if name == '#{replacement_column}'
            write_attribute('#{legacy_column_name}', value)
          else
            send(:write_attribute_without_#{legacy_column_name}_#{replacement_column}, name, value, &block)
          end
        end
        EOB
        
        alias_attribute replacement_column, legacy_column_name
        alias_method_chain :write_attribute, "#{legacy_column_name}_#{replacement_column}"
    end
    protected :setup_legacy_method
  end
end

class ActiveRecord::Base
  include LegacyWoes
end

