require_relative 'Piece.rb'
require 'colorize'
require 'byebug'
class Board
  attr_reader :grid
  def self.empty_grid
    grid = Array.new(8) do
      Array.new(8){}
    end

  end

  def populate
    @grid.each_with_index do |row, idx|
      if idx == 1 || idx == 6
        fill_pawns(row)
      elsif idx == 7 || idx == 0
        fill_pieces(row)
      else
        fill_null(row)
      end
    end
  end


  def fill_pawns(row)
    row.each_index do |idx|
      row[idx] = Piece.new("Pawn")
    end
    self
  end

  def fill_pieces(row)
    # row.each do |el|
    #   el = Piece.new("test")
    # end
    row[0..8] =  [Piece.new("Rook"),Piece.new("Knight"),Piece.new("Bishop"),
           Piece.new("King"),Piece.new("Queen"),Piece.new("Bishop"),
           Piece.new("Knight"),Piece.new("Rook")]
  end

  def fill_null(row)
    row.each_index do |idx|
      row[idx] = NullPiece.instance
    end
  end

  def initialize(grid = Board.empty_grid)
    @grid = grid
    populate
  end

  def [](pos)
      row, col = pos
      @grid[row][col]
  end
  #
  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos,end_pos)    # raise "There's no pieces at Starting position" if self[start_pos] == nil
    # raise "You can't move to that position" if valid_move?(self[start_pos], self[end_pos]) == false
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  # def interpret_move(pos)
  #   result = []
  #   splitsies = pos.split(",")
  #   splitsies.each_index do |idx|
  #     result[idx] = pos[idx]
  #   end
  #   result
  #   end
  # end

  def take_turn
    puts "Please choose what piece you'd like to move?"
    start_pos = gets.chomp
    puts "And where would you like to move it to?"
    end_pos = gets.chomp

    move_piece(start_pos,end_pos)


  end



  def valid_move?(start_pos, end_pos)
    start_pos = @grid[row][col]


  end


  def test_display
    @grid.each do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} | #{row[7]} |"
      .colorize(:color => :blue, :background => :black)
    end

  end

  def print_row_id
    @grid.each_index do |idx|
      print " #{idx} "
    end
  end




  def display
    print_row_id
    @grid.each_with_index do |row, idx|
      if idx.even?
        print " #{idx} "
        puts " "
        i = 0
          until i == row.length
            if i.even?
              print " #{row[i].symbol} ".colorize(:background => :light_magenta, :color => :light_white )
            else
              print " #{row[i].symbol} ".colorize(:color => :light_magenta)
            end
            i +=1
          end
      else
        print " #{idx} "
        puts " "
        j = 0
        until j == row.length
          if j.even?
            print " #{row[j].symbol} ".colorize(:color => :light_magenta)
          else
            print " #{row[j].symbol} ".colorize(:background => :light_magenta, :color => :light_white )
          end
            j +=1
        end
      end
      # row.each_with_index do |el,idx|
      #   if idx.even?
      #     print " #{el.symbol} ".colorize(:color => :red, :background => :black)
      #   else
      #     print " #{el.symbol} ".colorize(:color => :blue)
      #   end
      # end
      # puts " "# .colorize(:color => :red, :background => :black)
    end
    puts ""
  end

end


# board = Board.new
#  board.populate
# board.display
# board.move_piece([0,0],[3,3])
# system("clear")
# board.display
