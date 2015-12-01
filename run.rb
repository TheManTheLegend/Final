require "gosu"
require_relative "player"



class GameWindow < Gosu::Window
	def initialize 
		super 1920, 1080
		@player1 = Player.new(0,1)
		@player2 = Player.new(255,2)
		@puck = Puck.new

	end


	def update
		@player1.left if Gosu::button_down? Gosu::KbLeft
		@player1.right if Gosu::button_down? Gosu::KbRight
		@player1.up if Gosu::button_down? Gosu::KbUp
		@player1.down if Gosu::button_down? Gosu::KbDown
		@player1.pulse if Gosu::button_down? Gosu::Kb1
		@player1.move

		@player2.left if Gosu::button_down? Gosu::Kb4
		@player2.right if Gosu::button_down? Gosu::Kb6
		@player2.up if Gosu::button_down? Gosu::Kb8
		@player2.down if Gosu::button_down? Gosu::Kb2
		@player2.pulse if Gosu::button_down? Gosu::Kb5
		@player2.move
	end

	def draw
		@player1.draw
		@player2.draw
		@puck.draw
	end




end

window = GameWindow.new
window.show