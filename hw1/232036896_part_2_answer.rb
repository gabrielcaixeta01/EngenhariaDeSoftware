class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

# Jogo simples (letra a)
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  p1 = [game[0][0], game[0][1].to_s.upcase]
  p2 = [game[1][0], game[1][1].to_s.upcase]
  raise NoSuchStrategyError unless %w[R P S].include?(p1[1]) && %w[R P S].include?(p2[1])

  # Empates favorecem o jogador da esquerda
  return p1 if p1[1] == p2[1]

  wins = { "R" => "S", "S" => "P", "P" => "R" }
  wins[p1[1]] == p2[1] ? p1 : p2
end

p rps_game_winner([["Alice", "R"], ["Bob", "S"]])

# Torneio (letra b): estrutura em árvore binária
def rps_tournament_winner(tournament)
  if tournament[0].is_a?(String)
    return tournament
  end

  left_winner  = rps_tournament_winner(tournament[0])
  right_winner = rps_tournament_winner(tournament[1])
  rps_game_winner([left_winner, right_winner])
end

t = [
  [
    [["Kristen", "P"], ["Dave", "S"]],
    [["Richard", "R"], ["Michael", "S"]]
  ],
  [
    [["Allen", "S"], ["Omer", "R"]],
    [["David E.", "R"], ["Richard X.", "P"]]
  ]
]

p rps_tournament_winner(t)