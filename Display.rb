require_relative 'Board.rb'
require_relative 'Cursor.rb'
require 'colorize'

class Display

  attr_accessor :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    p @cursor.cursor_pos

    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        pos = [i, j]
        if pos == @cursor.cursor_pos
          print " #{piece.symbol} ".colorize(:background => :light_magenta)
        else
          if (i + j).even?
            print " #{piece.symbol} ".colorize(:background => :light_yellow)
          else (i + j).odd?
            print " #{piece.symbol} ".colorize(:background => :magenta)
          end
        end
      end
      puts
    end
    # @board.display
    # @board.grid[@cursor_pos].colorize(:background => :light_yellow, :color => :light_white )

  end
end
#

board = Board.new
display = Display.new(board)
while true
  system('clear')
  display.render
  display.cursor.get_input
end
