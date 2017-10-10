require_relative 'Piece.rb'
require 'colorize'

class Board

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
    p self
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
      row[idx] = NullPiece.new(" ")
    end
  end

  def initialize(grid = Board.empty_grid)
    @grid = grid

  end

  def [](pos)
      row, col = pos
      grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid = grid[row][col]
  end

  def move_piece(start_pos,end_pos)

    raise "There's no pieces at Starting position" if start_pos == nil
    raise "You can't move to that position" if end_pos != nil

  end

  def test_display
    @grid.each do |row|
      puts "| #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} | #{row[7]} |"
      .colorize(:color => :red, :background => :black)
    end

  end

  def display
    @grid.each do |row|
      row.each_with_index do |el,idx|
        if idx.even?
          print " #{el.symbol} ".colorize(:color => :red, :background => :black)
        else
          print " #{el.symbol} ".colorize(:color => :blue)
        end
      end
      puts " "# .colorize(:color => :red, :background => :black)
    end

  end



end


board = Board.new
 board.populate
p board.display
