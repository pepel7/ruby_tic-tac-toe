require_relative 'display'
require_relative 'board'

class Game
  include Display

  attr_reader :computer_team, :user_team, :winner, :board

  def initialize
    @board = Board.new
  end

  def play_game
    set_up_game
    until @winner || board.full?
      display_table
      ask_user_mark
      put_computer_mark
      check_winner
    end
    display_final_message
  end

  def set_up_game
    @user_team = choose_user_team
    set_teams
  end

  def choose_user_team
    print 'Pick a team (X or O): '
    team = gets.chomp.upcase
    return team if team.match?(/[XO]/)

    puts 'You should choose between X or O. Please try again: '
    choose_user_team
  end

  def set_teams
    if @user_team == 'X'
      @computer_team = 'O'
    elsif @user_team == 'O'
      @computer_team = 'X'
    end
  end

  def ask_user_mark
    position = user_input
    board.update_board(position, user_team)
  end

  def check_winner
    @winner = computer_team if board.combo_completed?(computer_team)
    @winner = user_team if board.combo_completed?(user_team)
  end

  def display_final_message
    display_table
    if @winner
      puts "Gameover. The winner is #{@winner}!"
    elsif table.full?
      puts 'A draw.'
    end
  end

  def put_computer_mark
    loop do
      pos = (1..9).to_a.sample
      if board.empty_square?(pos)
        board.update_board(pos, computer_team)
        break
      end
    end
  end

  private

  def user_input # rubocop:disable Metrics/MethodLength
    loop do
      print 'Enter a number where you want to put your mark: '
      position = gets.chomp
      verify_input(position)
      return position.to_i if position

      if !board.empty_square?(position)
        puts "That square is already marked. Let's choose another one."
      else
        puts 'Invalid input. Please try again.'
      end
    end
  end

  def verify_input(input)
    return input if !board.off_square?(input) && input.match?(/^\d$/)
  end
end
