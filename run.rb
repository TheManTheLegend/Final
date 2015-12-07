require "gosu"
require_relative "player"
require_relative "puck"
require_relative "goal"



class GameWindow < Gosu::Window
	def initialize 
		super 1920, 1080
		@player1 = Player.new("white",1)
		@player2 = Player.new("black",2)
		@puck = Puck.new
		@goal1 = Goal.new(0, 0)
		@goal2 = Goal.new(1920, 180)

		@background_image = Gosu::Image.new("gameboard.png", :tileable => true)

	end


	def update
		@player2.left if Gosu::button_down? Gosu::KbLeft
		@player2.right if Gosu::button_down? Gosu::KbRight
		@player2.up if Gosu::button_down? Gosu::KbUp
		@player2.down if Gosu::button_down? Gosu::KbDown
		pulse(@player2.x, @player2.y) if Gosu::button_down? Gosu::Kb1
		@player2.move

		@player1.left if Gosu::button_down? Gosu::KbA
		@player1.right if Gosu::button_down? Gosu::KbD
		@player1.up if Gosu::button_down? Gosu::KbW
		@player1.down if Gosu::button_down? Gosu::KbS
		pulse(@player1.x, @player1.y) if Gosu::button_down? Gosu::KbC
		@player1.move

		colliding?(@player1.x, @player1.y)
		colliding?(@player2.x, @player2.y)
		@puck.move
	end

	def pulse(x, y)
		@puck.pulse(x, y)
	end

	def colliding?(x, y)
		@puck.colliding?(x, y)
	end

	def draw
		@player1.draw
		@player2.draw
		@puck.draw
		@goal1.draw
		@goal2.draw
		
		@background_image.draw(0, 0, 0)
	end




end

window = GameWindow.new
window.show
