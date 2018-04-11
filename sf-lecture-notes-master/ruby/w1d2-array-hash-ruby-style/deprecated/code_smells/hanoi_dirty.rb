class TowersOfHanoiGame
  def self.disks
    (1..3).to_a.reverse
  end

  def self.default_stacks
    [TowersOfHanoiGame.disks, [], []]
  end

  def initialize(stacks = TowersOfHanoiGame.default_stacks)
    @stacks = stacks
  end

  def render
    max_height = @stacks.map(&:count).max

    (max_height-1).downto(0).map do |height|
      @stacks.map do |stack|
        stack[height] || " "
      end.join("\t")
    end.join("\n")
  end

  def display
    puts render
  end

  def move(from_stack_num, to_stack_num)
    from_stack, to_stack =
      @stacks.values_at(from_stack_num, to_stack_num)

    raise "cannot move from empty stack" if from_stack.empty?
    unless (to_stack.empty? || to_stack.last > from_stack.last)
      raise "cannot move onto smaller disk"
    end

    to_stack.push(from_stack.pop)
    self
  end

  def game_won?
    @stacks[0].empty?&&@stacks[1..2].any?(&:empty?)
  end

  def run_game
    until game_won?
      display

      move_hash = {
        "a" => 0,
        "b" => 1,
        "c" => 2
      }

      while true
        print "Move from: "
        from_stack_num = move_hash[gets.chomp]
        return from_stack_num unless from_stack_num.nil?

        puts "Invalid move!"
      end

      while true
        print "Move to: "
        to_stack_num = move_hash[gets.chomp]
        return to_stack_num unless to_stack_num.nil?

        puts "Invalid move!"
      end

      move(from_stack_num, to_stack_num)
    end

    puts "You did it!"
  end
end
