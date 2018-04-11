require "set"
require_relative "player"
require 'byebug'

class GhostGame
  ALPHABET = Set.new(("a".."z").to_a)
  MAX_LOSS_COUNT = 1

  def initialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp) # call .chomp on each element
    #                                       .map(&:chomp) same as .map { |el| el.chomp }
    @dictionary = Set.new(words)
    @players = players
    @losses = {}

    players.each { |player| losses[player] = 0 }
  end

  def run
    play_round until game_over?
    puts "#{winner} wins!"
  end

  private
  # everything after private is only able to be called implicitly by this class
  attr_reader :fragment, :dictionary, :losses, :players

  # attr_accessor :fragment does this:
  #
  # def fragment
  #   @fragment
  # end
  #
  # def fragment=(new_fragment)
  #   @fragment = new_fragment
  # end

  # attr_accessor makes #fragment and #fragment=
  # attr_reader makes only #fragment
  # attr_writer makes only #fragment=

  def add_letter(letter)
    self.fragment << letter # modify (mutate) fragment in-place (couldn't use = here b/c there is no attr_writer)
    # self.fragment = fragment + letter # reassigns the @fragment instance variable
    # ^^ we don't have this method unless we define it or use the attr_accessor
    # fragment here is calling the #fragment method created
    # by attr_reader above
    # @fragment would give direct access to instance variable without
    # calling the #fragment method. NB: be careful of typos w/ @fragment!
    puts "#{current_player} added the letter '#{letter}' to the fragment."
  end

  def current_player
    players.first
  end

  def display_standings
    return if losses.all? { |_, v| v == 0 }
    # .all? passes two variables to be declared in the pipes
    # using _ as a variable name indicates to readers that
    # we don't care about the first variable passed to
    # pipes by .all?
    # This approach is simply for readability/semantics and
    # does not affect how the program runs

    puts "Current standings:"
    players.each do |player|
      next if losses[player] == 0
      puts "#{player}: #{record(player)}"
    end

    sleep(2)
  end

  def game_over?
    remaining_players == 1
  end

  def is_word?(fragment)
    dictionary.include?(fragment)
  end

  def next_player!
    players.rotate!
    # keep rotating until we find a player who hasn't been eliminated
    players.rotate! until losses[current_player] < MAX_LOSS_COUNT
  end

  def play_round
    @fragment = ""
    welcome

    until round_over?
      take_turn(current_player)
      next_player!
    end

    update_standings
  end

  def previous_player
    players.last
  end

  def record(player)
    count = losses[player]
    "GHOST".slice(0, count)
  end

  def remaining_players
    losses.count { |_, v| v < MAX_LOSS_COUNT }
  end

  def round_over?
    is_word?(fragment)
  end

  def take_turn(player)
    system("clear")
    puts "It's #{player}'s turn!"
    letter = nil

    until letter && valid_play?(letter)
      letter = player.guess(fragment)
      player.alert_invalid_move(letter) unless valid_play?(letter)
    end

    add_letter(letter)
  end

  def update_standings
    puts "#{previous_player} spelled #{fragment}."
    puts "#{previous_player} gets a letter!"

    losses[previous_player] += 1

    if losses[previous_player] == MAX_LOSS_COUNT
      puts "#{previous_player} has been eliminated!"
    end

    sleep(2)
  end

  def valid_play?(letter)
    return false unless ALPHABET.include?(letter)

    new_fragment = fragment + letter
    dictionary.any? { |word| word.start_with?(new_fragment) }
  end

  def welcome
    system("clear")
    puts "Let's play a round of Ghost!"
    display_standings
  end

  def winner
    (player, _) = losses.find { |_, losses| losses < MAX_LOSS_COUNT }
    # .find on a hash will return the key, value pair for which the block is true
    # we don't care about the value and want to set the key to player

    # underscore means we don't care about that variable that
    # ruby forces on us

    player
  end
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new(Player.new("Gizmo"), Player.new("Breakfast"))
  game.run
end

cat = 'cat'
def some_method(cat)
  cat == 'dog'
end
