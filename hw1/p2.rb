class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  p1 = [game[0][0], game[0][1].to_s.upcase]
  p2 = [game[1][0], game[1][1].to_s.upcase]
  
	raise NoSuchStrategyError unless %w[R P S].include?(p1[1]) && %w[R P S].include?(p2[1])

  return p1 if p1[1] == p2[1]
  wins = { "R" => "S", "S" => "P", "P" => "R" }
  wins[p1[1]] == p2[1] ? p1 : p2
end

p rps_game_winner([ [ "Kristen", "P" ], [ "Pam", "S" ] ])