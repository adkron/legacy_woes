module LegacyWoes
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def created_at_column(legacy_column_name)
      alias_method_chain :write_attribute, "#{legacy_column_name}_created_at"
      
      define_method("write_attribute_with_#{legacy_column_name}_created_at", name, value, &block) do
        if name == 'created_at'
          write_attribute('datesubmitted', value)
        else
          send("write_attribute_without_#{legacy_column_name}_created_at", name, value, &block)
        end
      end
      
      define_method(:created_at) do
        send(legacy_column_name)
      end
      
      define_method(:created_at=, value) do
        send("#{legacy_column_name}=", value)
      end
    end
  end
end

class ActiveRecord::Base
  include LegacyWoes
end

