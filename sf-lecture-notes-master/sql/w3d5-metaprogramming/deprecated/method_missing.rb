class SchmactivePeckardVase

  def method_missing(method_name, *args)
    method_name_str = method_name.to_s

    if method_name_str.start_with?("find_by_")
      attributes_string = method_name_str[("find_by_".length)..-1]
      attribute_names = attributes_string.split("_and_")

      unless attribute_names.length == args.length
        raise "unexpected # of arguments"
      end

      search_conditions = {}
      attribute_names.length.times do |i|
        search_conditions[attribute_names[i]] = args[i]
      end

      p search_conditions
    else
      # complain about the missing method
      super
    end
  end

end

collection = SchmactivePeckardVase.new
collection.find_by_username_and_password("Stephen", "123456")
# collection.do_something_else