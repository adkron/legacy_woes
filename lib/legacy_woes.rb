module LegacyWoes
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
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
         
      define_method :created_at do
        send(legacy_column_name)
      end
    
      define_method :created_at= do |value|
        send('#{legacy_column_name}=', value)
      end
      alias_method_chain :write_attribute, "#{legacy_column_name}_created_at"
    end
    
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
         
      define_method :updated_at do
        send(legacy_column_name)
      end
    
      define_method :updated_at= do |value|
        send('#{legacy_column_name}=', value)
      end
      alias_method_chain :write_attribute, "#{legacy_column_name}_updated_at"
    end
  end
end

class ActiveRecord::Base
  include LegacyWoes
end

