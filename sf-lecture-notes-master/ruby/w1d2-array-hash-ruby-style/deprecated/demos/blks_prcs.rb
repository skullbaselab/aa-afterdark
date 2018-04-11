require 'byebug'


################## Procs and Blocks #########################

def do_block(&blk)
  blk.call
end

def do_proc(prc)
  prc.call
end

def do_proc_and_block(prc = nil, &blk)
  prc ||= Proc.new{ puts "default proc" }
  prc.call
  blk.call
end

# do_block { puts "Hello world! I'm from the block!" }
# do_proc(Proc.new { puts "Hello world! From the proc!" })
# do_proc_and_block(Proc.new { puts "Run me first!" }) do
#   puts "then run me!"
# end
