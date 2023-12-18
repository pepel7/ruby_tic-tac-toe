### Pseudocode ###

# Дізнатися в юзера його бажану команду
# Поставити протилежну команду комп'ютеру
# Запитати в юзера бажане місце для знаку
# Поставити в це бажане місце знак
# Вибрати рандомом місце для знаку комп'ютера
# Поставити в рандомне місце знак комп'ютера
#
# Коли будь-який гравець досяг 3-ох поставлених знаків, перевірити, чи не стоять
# чиїсь знаки в ряд чи діагонально
# Якщо стоять, цей гравець -- переможець 
# Якщо ні, продовжити розставляння знаків по черзі
# Якщо кількість усіх поставлених знаків == 9 -- нічия
#
# Відобразити результати гри

### Classes ###

class Mark
  def initialize(position)
    @position = position
  end
end

class Nought
  @@owner = nil
  
  def self.owner
    @@owner
  end

  def self.owner=(owner)
    @@owner = owner
  end

  def initialize(position)
    super(position)
  end
end

class Cross
  @@owner = nil

  def self.owner
    @@owner
  end

  def self.owner=(owner)
    @@owner = owner
  end

  def initialize(position)
    super(position)
  end
end

### Methods ###

require "colorize"

def get_user_team
  team = ""
  loop do
    puts "Pick a team (X or O):"
    team = gets.chomp.upcase
    break if team == "X" || team == "O"
    puts "You should choose between X or O. Please try again:"
  end
  team
end

def set_teams(user_team)
  if user_team == "X"
    Cross.owner = "user"
    Nought.owner = "computer"
  elsif user_team == "O"
    Cross.owner = "computer"
    Nought.owner = "user"
  end
end

def colorize_coord(coordinate)
  if coordinate.to_i > 0
    coordinate.gray
  elsif coordinate.class.owner == "user"
    coordinate.purple
  else coordinate end
end

def show_table(table)
  puts "  ___________________
  |     |     |     |
  |  #{colorize_coord(table[0][0])}  |  #{colorize_coord(table[0][1])}  |  #{colorize_coord(table[0][2])}  |
  |_____|_____|_____|
  |     |     |     |
  |  #{colorize_coord(table[1][0])}  |  #{colorize_coord(table[1][1])}  |  #{colorize_coord(table[1][2])}  |
  |_____|_____|_____|
  |     |     |     |
  |  #{colorize_coord(table[2][0])}  |  #{colorize_coord(table[2][1])}  |  #{colorize_coord(table[2][2])}  |
  |_____|_____|_____|
  "
end

### Program ###

user_team = get_user_team
set_teams(user_team)

table = [
  ["1", "2", "3"],
  ["4", "5", "6"],
  ["7", "8", "9"]
]

show_table(table)
