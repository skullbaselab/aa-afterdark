require_relative 'board'
require_relative 'human_player'
require 'byebug'

class Game
  attr_reader :board, :display, :current_player, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until won?
      begin
        start_pos, end_pos = players[current_player].make_move(board)

        board.move_piece(current_player, start_pos, end_pos)

        swap_turn!
        notify_players
      rescue StandardError => e # a custom ChessError class would have been better
        @display.notifications[:error] = e.message
        retry
      end
    end

    display.render
    puts "#{current_player} is checkmated."

    nil
  end

  private

  def won?
    board.checkmate?(current_player)
  end

  def notify_players
    if board.in_check?(current_player)
      display.set_check!
    else
      display.uncheck!
    end
  end

  def swap_turn!
    @current_player = (current_player == :white) ? :black : :white
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
