class Towers
  attr_reader :towers

  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(from, to)
    @towers[to].push(@towers[from].pop)
  end

  def valid_move(from, to)
    if @towers[from].empty?
      false
    elsif !(@towers[to].empty?) &&
    (@towers[from].last > @towers[to].last)
      false
    else
      true
    end
  end

  def won?
    return true if @towers[0].empty && (@towers[1] || @towers[2]).empty?
  end 




end
