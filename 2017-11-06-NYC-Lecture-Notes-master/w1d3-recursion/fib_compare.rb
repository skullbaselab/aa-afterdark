require 'benchmark'

class FibCompare
  def initialize
    @calls_to_good_fibs = 0
    @calls_to_bad_fibs = 0
  end

  def compare(n)
    good_fibs(n)
    puts "Number of calls to #good_fibs: #{@calls_to_good_fibs}"

    bad_fibs(n)
    puts "Number of calls to #bad_fibs: #{@calls_to_bad_fibs}"
  end

  def benchmark
    puts '================'
    puts '#good_fibs:'
    Benchmark.bm do |x|
      8.times do |i|
        x.report("n = #{i + 10}") { good_fibs(i + 10) }
      end
    end

    puts '================'
    puts '#bad_fibs:'
    Benchmark.bm do |x|
      8.times do |i|
        x.report("n = #{i + 10}") { bad_fibs(i + 10) }
      end
    end
  end

  def good_fibs(n)
    # copy code here
  end

  def bad_fibs(n)
    # copy code here
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
