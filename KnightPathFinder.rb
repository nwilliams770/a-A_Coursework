class KnightPathFinder
MOVE_DIFFERENTIALS = [
  [-2,-1],
[-1,-2],
[1,2],
[2,1],
[1,-2],
[-2,1],
[2,-1],
[-1,2]
]
  attr_reader :starting_pos

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
  end

#need to add self
  def valid_moves(pos)
    valids = []
    MOVE_DIFFERENTIALS.each do |move_diff|
      valids << [(pos[0] + move_diff[0]), (pos[1] + move_diff[1])]
    end
    valids.select { |move| on_board?(move) }
  end

  def on_board?(pos)
    pos[0].between?(0,9) && pos[1].between?(0,9)
  end

  def new_move_positions(pos)
    moves = valid_moves(pos)
    moves.reject {|move| @visited_positions.include?(move) }
  end

  def build_move_tree(pos, target)
    queue = [pos]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node == target_pos
      queue.concat(new_move_positions(current_node))
  end
end
