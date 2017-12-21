require "singleton"

DISPLAY = {
  'Pawn' => '♟',
  'Knight' => '♞',
  'Queen' => '♚',
  'Bishop' => '♝',
  'Rook' => '♜',
  'King' => '♛'
}

module SteppingPiece
  KING = [
    [-1, 0], #up
    [1, 0], #down
    [-1, -1], #upleft
    [-1, 1], #upright
    [1,-1], #downleft
    [1,1], #downright
    [0,1], #right
    [1,0] #left
  ]

  KNIGHT = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-2, 1],
    [2, -1],
    [2, 1],
    [-1, 2],
    [1, 2]
  ]
end

def moves(starting_pos)
  all_moves = []
  KING.each do |move|
    all_moves << [(starting_pos[0] + move[0]), (starting_pos[1] + move[1])]
  end

end

module SlidingPiece
  # can move several steps at a timeç if no obstacles

  until ending_pos == NullPiece
    new_pos = ( (start_pos[0] + (start_pos[0]+1), (start_pos[1] + (start_pos[1]+1) )
  end


end


class Piece

  attr_reader :name, :symbol

  def initialize(name)
    @name = name
    @symbol = DISPLAY[name]
  end

  # def moves
  #   # the starting position + the differences generated base on our moves
  #   # and then swapping the end_post w/ our original pos
  #
  #   chess_pos = self.pos # how do we get out own pos is the question... ._.
  #   move_pos = @cursor.cursor_pos # the pos we want to move to
  #
  #   # need to compare chess_pos to the move_pos. They can only increase by 1
  #   # unless it's a knight they can increse by 2
  #   # if false then raise error for invalid move
  #
  #   @board.grid.each_with_index do |row, i|
  #     row.each_with_index do |piece, j|
  #       pos = [i, j]
  #
  #       end
  #     end


  end

  def moves_dir
    # we can have 2 of them, if it were bishop, rook, or queen,
    # they can move in diagonals
    # else all other pieces can only move in regular directions.

  end

end

class Knight < Piece
  include SteppingPiece
end

class NullPiece < Piece
  include Singleton
  def initialize
    @symbol = " "
  end
end
