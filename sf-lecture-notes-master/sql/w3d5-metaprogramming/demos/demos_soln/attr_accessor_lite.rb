require 'byebug'
Object.class_eval do
  # debugger
  def attribute_accessor_lite(*attribute_names)
    # debugger
    attribute_names.each do |attribute_name|
      class_eval <<-MAGIC_STRING
          def #{attribute_name}
              puts '\t ---> generate getter'
              @#{attribute_name}
          end

          def #{attribute_name}=( new_value )
              puts '\t ---> generated setter'
              @#{attribute_name} = new_value
          end
        MAGIC_STRING
    end
  end
end
