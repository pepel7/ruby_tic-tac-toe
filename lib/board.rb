class Board
  attr_accessor :table

  WIN_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @table = {
      1 => 1,   2 => 2,   3 => 3,
      4 => 4,   5 => 5,   6 => 6,
      7 => 7,   8 => 8,   9 => 9
    }
  end

  def update_board(coord, symbol)
    table[coord] = symbol
  end

  def empty_square?(coord)
    @table[coord].is_a?(Integer)
  end

  def off_square?(coord)
    @table[coord].nil?
  end

  def full?
    @table.all? { |_key, value| !empty_square?(value) }
  end

  def combo_completed?(team)
    WIN_COMBOS.any? do |combo|
      combo.all? { |pos| table[pos] == team }
    end
  end
end
