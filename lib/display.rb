require 'colorize'

module Display
  def colorize_coord(coordinate)
    if board.empty_square?(coordinate)
      coordinate.to_s.gray
    elsif coordinate == user_team
      coordinate.magenta
    else
      coordinate
    end
  end

  def display_table # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    puts "    ___________________
    |     |     |     |
    |  #{colorize_coord(board.table[1])}  |  #{colorize_coord(board.table[2])}  |  #{colorize_coord(board.table[3])}  |
    |_____|_____|_____|
    |     |     |     |
    |  #{colorize_coord(board.table[4])}  |  #{colorize_coord(board.table[5])}  |  #{colorize_coord(board.table[6])}  |
    |_____|_____|_____|
    |     |     |     |
    |  #{colorize_coord(board.table[7])}  |  #{colorize_coord(board.table[8])}  |  #{colorize_coord(board.table[9])}  |
    |_____|_____|_____|
    "
  end
end
