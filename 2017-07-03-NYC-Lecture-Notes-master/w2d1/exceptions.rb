def get_input
  input = gets.chomp

  parsed_input = input.split(", ")

  use_input(parsed_input)
end


def use_input(input)
  input / 5
end


def parse_input

  get_input

  rescue
    puts "Ruh-roh! An error has occurred."
    retry

end
