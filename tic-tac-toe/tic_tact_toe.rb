require './lib/board'
require './lib/player'
require './lib/space'

@players = []
@currentplayer

def main_menu
  puts "New game started..."
  @turn_counter = 9
  @winner = false
  @spots =["0","1","2","3","4","5","6","7","8"]


  playerX = Player.create('X')
  playerO = Player.create('O')
  puts playerX.spots
  puts playerO.spots

  @players << playerX
  @players << playerO
  @currentplayer = playerX
  @game_board = populate_board
  tic_tac
end

def populate_board
  new_board = Board.new
    (1..9).each do |y|
      space = Space.create(y)
      new_board.add_space(space)
    end
  new_board
end

def did_win(player)
  wins = [[7, 8, 9], [4, 5, 6], [1, 2, 3], [7, 5, 3], [1,4,7], [2,5,8], [3,6,9], [9,5,1]]

  in_row = 0

  @winner = false

  wins.each do |space|
    in_row = 0
    space.each do |space_coord|
      player.spots.each do |spot|
        if space_coord == spot.spot
          in_row += 1
        end
      end
      if in_row == 3
        @winner = true
      end
    end
  end
  @winner
end

def next_turn
  if @currentplayer != @players[0]
    @currentplayer = @players[0]
  elsif @currentplayer != @players[1]
    @currentplayer = @players[1]
  end
end

@turn_counter = 9
@spots =["0","1","2","3","4","5","6","7","8"]

def tic_tac

  if @winner == true || @turn_counter == 0
    @currentplayer = next_turn

    puts "
     #{@spots[0]} : #{@spots[1]}  : #{@spots[2]}
    ------------
     #{@spots[3]} : #{@spots[4]}  : #{@spots[5]}
    ------------
     #{@spots[6]} : #{@spots[7]}  : #{@spots[8]}
    "

    puts "#{@currentplayer.name} wins!"
    puts "Start a new game"
  else

    puts "
     #{@spots[0]} : #{@spots[1]}  : #{@spots[2]}
    ------------
     #{@spots[3]} : #{@spots[4]}  : #{@spots[5]}
    ------------
     #{@spots[6]} : #{@spots[7]}  : #{@spots[8]}
    "
    puts "#{@currentplayer.name} enter spot"
    player_choice = gets.chomp

    if @game_board.find(player_choice.to_i + 1).marked == ""
      @game_board.find(player_choice.to_i + 1).marked_by(@currentplayer)
      @currentplayer.spots << @game_board.find(player_choice.to_i + 1)
      @spots[player_choice.to_i] = @currentplayer.name

      @winner = did_win(@currentplayer)

      @currentplayer = next_turn
      @turn_counter -= 1
      tic_tac
    else
      puts "Spot taken!"
      tic_tac
    end
  end
end

main_menu

