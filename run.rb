require "gosu"
require_relative "player"
require_relative "puck"



class GameWindow < Gosu::Window
	def initialize 
		super 1920, 1080
		@player1 = Player.new("white",1)
		@player2 = Player.new("black",2)
		@puck = Puck.new

		@background_image = Gosu::Image.new("gameboard.png", :tileable => true)

	end


	def update
		@player2.left if Gosu::button_down? Gosu::KbLeft
		@player2.right if Gosu::button_down? Gosu::KbRight
		@player2.up if Gosu::button_down? Gosu::KbUp
		@player2.down if Gosu::button_down? Gosu::KbDown
		@player2.pulse if Gosu::button_down? Gosu::Kb1
		@player2.move

		@player1.left if Gosu::button_down? Gosu::KbA
		@player1.right if Gosu::button_down? Gosu::KbD
		@player1.up if Gosu::button_down? Gosu::KbW
		@player1.down if Gosu::button_down? Gosu::KbS
		@player1.pulse if Gosu::button_down? Gosu::KbC
		@player1.move
	end

	def draw
		@player1.draw
		@player2.draw
		@puck.draw
		@background_image.draw(0, 0, 0)
	end




end

window = GameWindow.new
window.show