require 'benchmark'

class FibCompare
  def initialize
    @calls_to_good_fib = 0
    @calls_to_bad_fib = 0
  end

  def compare(n)
    good_fib(n)
    puts "Number of calls to #good_fib: #{@calls_to_good_fib}"

    bad_fib(n)
    puts "Number of calls to #bad_fib: #{@calls_to_bad_fib}"
  end

  def benchmark
    puts '================'
    puts '#good_fib:'
    Benchmark.bm do |x|
      19.times do |i|
        x.report("n = #{i}") { good_fib(i) }
      end
    end

    puts '================'
    puts '#bad_fib:'
    Benchmark.bm do |x|
      19.times do |i|
        x.report("n = #{i}") { bad_fib(i) }
      end
    end
  end

  def bad_fib(n)
    @calls_to_bad_fib += 1
    #base case(s)
    return [0] if n == 0
    return [0, 1] if n == 1

    #inductive step
    prev_seq = bad_fib(n - 1)
    last = bad_fib(n - 1)[-1]
    second_to_last = bad_fib(n - 1)[-2]

    prev_seq << last + second_to_last
  end

  def good_fib(n)
      @calls_to_good_fib += 1
      #base case(s)
      return [0] if n == 0
      return [0, 1] if n == 1

      #inductive step
      prev_seq = good_fib(n - 1)

      last = prev_seq[-1]
      second_to_last = prev_seq[-2]

      prev_seq << last + second_to_last
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV[0]
  when 'benchmark'
    FibCompare.new.benchmark
  else
    FibCompare.new.compare(Integer(ARGV[0]))
  end
end
