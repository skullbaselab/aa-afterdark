# Error Handling Notes

* Raise exceptions sparingly until you are hardening a project. Focus on driving out the functionality first. And don't waste your time imagining perverse scenarios; assume for the moment that the universe doesn't hate you. Just consider the things that could reasonably go wrong. You can always add more exception-handling code later.

* Remember the maxim: you ain't gonna need it. Wait to implement functionality when you need it, not when you anticipate it.

```ruby
def divide_two_num
    puts "Let's divide 2 numbers."
    print "num 1 > "
    num1 = Float(gets.chomp)
    raise RuntimeError.new("RuntimeError1") if num1==0 
    print "num 2 > "
    num2 = Float(gets.chomp)
    raise ZeroDivisionError if num2 == 0
    
    raise "RuntimeError1" #creates a RuntimeError
    num1 / num2
    
end

def test_divide_two_num
  begin
    divide_two_num
  rescue ZeroDivisionError
    puts "cannot divide by zero"
    retry
  rescue ArgumentError
    puts "requires a number!"
    retry
  rescue RuntimeError => e
    case e.message
    when "RuntimeError1"
      puts "RuntimeError1" 
      # put your handler code here
      retry
    end
  end
end 

```