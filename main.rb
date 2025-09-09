require_relative 'lib/game'

game = Game.new
while game.turn < 12
  game.cguess
  game.feedback
  game.mwin
  game.cwin
  break if game.black == 4
end