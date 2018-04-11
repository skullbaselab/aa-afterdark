require 'benchmark'

class FibTester

  def initialize()
    @good_calls = 0;
    @bad_calls = 0;
  end

  def good_fibs(n)
    @good_calls += 1
    return [0, 1].take(n) if n <= 2
    prev_fibs = good_fibs(n - 1)
    return prev_fibs + [prev_fibs[-1], prev_fibs[-2]]
  end

  def bad_fibs(n)
    @bad_calls += 1
    return [0, 1].take(n) if n <= 2
    return bad_fibs(n - 1) + [bad_fibs(n - 1)[-1], bad_fibs(n - 1)[-2]]
  end

  def compare_calls(n)
    good_fibs(n)
    bad_fibs(n)
    puts "Number of calls to #good_fibs: #{@good_calls}"
    puts "Number of calls to #bad_fibs: #{@bad_calls}"
  end

  def benchmark_fibs
    puts "================"
    puts "good fibs:"
    8.times do |i|
      print "i: #{i + 10}"
      puts Benchmark.measure { good_fibs(i + 10) }
    end

    puts "================"
    puts "bad fibs:"
    8.times do |i|
      print "i: #{i + 10}"
      puts Benchmark.measure { bad_fibs(i + 10) }
    end
  end

end

if $PROGRAM_NAME == __FILE__
  case ARGV[0]
  when "benchmark"
    FibTester.new.benchmark_fibs
  else
    FibTester.new.compare_calls(ARGV[0].to_i)
  end
end
