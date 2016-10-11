#initial setup of board. All spaces between the lines.
$spots = {"a1" => " ", "a2" => " ", "a3" => " ",
	"b1" => " ", "b2" => " ", "b3" => " ",
	"c1" => " ", "c2" => " ", "c3" => " "
}

def show_board(player_number, turn)

		case turn
			when "a1"
			  $spots["a1"] = player_number == "Player 01" ? "X" : "0"
			when "a2"
			  $spots["a2"] = player_number == "Player 01" ? "X" : "0"
			when "a3"
			  $spots["a3"] = player_number == "Player 01" ? "X" : "0"
			when "b1"
			  $spots["b1"] = player_number == "Player 01" ? "X" : "0"
			when "b2"
			  $spots["b2"] = player_number == "Player 01" ? "X" : "0"
			when "b3"
			  $spots["b3"] = player_number == "Player 01" ? "X" : "0"
			when "c1"
			  $spots["c1"] = player_number == "Player 01" ? "X" : "0"
			when "c2"
			  $spots["c2"] = player_number == "Player 01" ? "X" : "0"
			when "c3"
			  $spots["c3"] = player_number == "Player 01" ? "X" : "0"
		end

	puts "|#{$spots["a1"]}|#{$spots["a2"]}|#{$spots["a3"]}|\n|#{$spots["b1"]}|#{$spots["b2"]}|#{$spots["b3"]}|\n|#{$spots["c1"]}|#{$spots["c2"]}|#{$spots["c3"]}|"
end

class Player
	def	initialize(player_number)
		@playerTurns = []
	end

	def turn(player_number)
		winning_conditions = [["a1", "a2", "a3"], ["a1", "b2", "c3"], ["a1", "b1", "c1"], ["a2", "b2", "c2"], ["a3", "b2", "c1"], ["a3", "b3", "c3"], ["b1", "b2", "b3"], ["c1", "c2", "c3"]]
		
		puts "Your turn, #{player_number}..."
		player_choice = gets.chomp
		if $spots[player_choice] == " "
			@playerTurns.push(player_choice)
			show_board(player_number, player_choice)
			else
			puts "Occupied! Try again"
			self.turn(player_number)
		end
		
		winning_conditions.each do|arr|
			if(arr & @playerTurns).length == 3
			puts "You won!"
			$gameOver = true
			end
		end
		
		
		
	end
end

class TicTacToe
	$gameOver = false
	$player01 = Player.new(1)
	$player02 = Player.new(2)
	while $gameOver == false
		$player01.turn("Player 01")
		break if $gameOver == true
		$player02.turn("Player 02")
	end
end
myTicTacToe = TicTacToe.new

