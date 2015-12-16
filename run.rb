require "gosu"
require_relative "player"
require_relative "puck"
require_relative "goal"




class GameWindow < Gosu::Window
	def initialize 
		super 1920, 1080
		self.caption = "Final"
		@player1 = Player.new("white",1)
		@player2 = Player.new("black",2)
		@puck = Puck.new
		@goal1 = Goal.new(0, 0)
		@goal2 = Goal.new(1920, 180)
		@font = Gosu::Font.new(80)
		@scored = false
		@scoredp = 0
		
		@background_image = Gosu::Image.new("gameboard.png", :tileable => true)

	end


	def update
		@player2.left if Gosu::button_down? Gosu::KbLeft
		@player2.right if Gosu::button_down? Gosu::KbRight
		@player2.up if Gosu::button_down? Gosu::KbUp
		@player2.down if Gosu::button_down? Gosu::KbDown
		pulse(@player2.x, @player2.y) if Gosu::button_down? Gosu::KbNumpad1
		@player2.move

		@player1.left if Gosu::button_down? Gosu::KbA
		@player1.right if Gosu::button_down? Gosu::KbD
		@player1.up if Gosu::button_down? Gosu::KbW
		@player1.down if Gosu::button_down? Gosu::KbS
		pulse(@player1.x, @player1.y) if Gosu::button_down? Gosu::KbC
		@player1.move

		if @player1.myscore > 9
			close
			print "Player 1 Wins!!!!!!!!!!!!!!!!"
		elsif @player2.myscore > 9
			close
			print "Player 2 Wins!!!!!!!!!!!!!!!!"
		end

		colliding?(@player1.x, @player1.y)
		colliding?(@player2.x, @player2.y)
		@puck.move
		if @puck.puck_x < 50 && @puck.puck_y < 640 && @puck.puck_y > 440
			@player2.score
			@scored = true
			@scoredp = 2
			
			reset
		elsif @puck.puck_x > 1820 && @puck.puck_y < 640 && @puck.puck_y > 440
			@player1.score
			@scored = true
			@scoredp = 1
			reset
		end
		
	end
	def score(x)
		@font.draw("Player #{x} has scored!", 200, 30, 6, 1, 1, 0xff_0000ff)
		sleep(1)
	end

	def pulse(x, y)
		@puck.pulse(x, y)
	end
	def reset

		@player1.reset
		@player2.reset
		@puck.reset
		
	end
	def start
		@font.draw("3", 500, 100, 5, 1, 1, 0xff_ff0000)
		sleep(1)
		@font.draw("2", 500, 100, 5, 1, 1, 0xff_ffff00)
		sleep(1)
		@font.draw("1", 500, 100, 5, 1, 1, 0xff_00ff00)
		sleep
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
		# if @scored == true
		# 	@font.draw("Player #{@scoredp} has scored!", 860, 540, 6, 1, 1, 0xff_0000ff)
		# 	# sleep(1)
		# 	# start
		# 	@scored = false
		# end
		# if @scored == 2
		# 	@font.draw("Player #{@scored} has scored!", 200, 30, 6, 1, 1, 0xff_0000ff)
		# 	sleep(1)
		# 	start
		# 	@scored = 0
		# end
		@background_image.draw(0, 0, 0)
	end




end

window = GameWindow.new
window.show
