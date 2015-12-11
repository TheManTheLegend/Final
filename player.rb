require "gosu"
require_relative "puck"




class Player
	def initialize(color, player)
		@image = Gosu::Image.new("#{color}.png")
		@acceleration = 1
		@x_vel = 0
		@y_vel = 0
		@height = 1080
		@width = 1920
		@y_pos = (@height / 2) - 50
		@y_start = (@height / 2) - 50
		if player == 1
			@x_pos = 400
			@x_start = 400
			@derp = 10
		elsif player == 2
			@x_pos = 1520
			@x_start = 1520
			@derp = 980
		end
		@player = player
		@score = 0
		@font = Gosu::Font.new(30)
		
	
	end

	def score
		@score += 1
	end



	def up
		if @y_vel < 30
			@y_vel -= @acceleration
		end
	end

	def down
		if @y_vel > -30
			@y_vel += @acceleration
		end
	end

	def left
		if @x_vel < 30
			@x_vel -= @acceleration
		end
	end

	def right
		if @x_vel > -30
			@x_vel += @acceleration
		end
	end
	def reset
		@y_pos = @y_start
		@x_pos = @x_start
		@y_vel = 0
		@x_vel = 0
	end

	

	def x
		@x_pos

	end
	def y
		@y_pos
	end

	def move
		@x_pos += @x_vel
		@y_pos += @y_vel
		#board limits
		if @x_pos > @width - 50
			@x_vel = -1 * @x_vel
			@x_pos = @width - 50
		end		

		if @y_pos > @height - 50
			@y_vel = -1 * @y_vel
			@y_pos = @height - 50
		end		

		if @x_pos < 0 - 50
			@x_vel = -1 * @x_vel
			@x_pos = -50
		end		

		if @y_pos < 0 - 50
			@y_vel = -1 * @y_vel
			@y_pos = -50
		end	

		#left goal limits
		# if  @x_pos < 100
		# 	if @y_pos < @height/2 - 100 && @y_pos < @height/2 + 100
		# 		@y_pos = @height/ 2 - 100
		# 		@y_vel = -1 * @y_vel
		# 	elsif @y_pos > @height/2 + 100 && @y_pos > @height/2 - 100
		# 		@y_pos = @height/ 2 + 150
		# 		@y_vel = -1 * @y_vel
		# 	elsif @y_pos > @height/2 - 100 && @y_pos < @height/2 + 100
		# 		@x_pos = 100
		# 		@x_vel = -1 * @x_vel
		# 	end
		# end	

		# if @y_pos > @height/2 - 100 && @x_pos < 100
		# 	@y_vel = -1 * @y_vel
		# 	@y_pos = @height/ 2 - 100
		# end			
		# if @y_pos < 0 - 50
		# 	@y_vel = -1 * @y_vel
		# 	@y_pos = -50
		# end	

		#right goal limits
		# if @x_pos > @width - 50
		# 	@x_vel = -1 * @x_vel
		# 	@x_pos = @width - 50
		# end		

		# if @y_pos > @height - 50
		# 	@y_vel = -1 * @y_vel
		# 	@y_pos = @height - 50
		# end		

		# if @x_pos < 0 - 50
		# 	@x_vel = -1 * @x_vel
		# 	@x_pos = -50
		# end		

		# if @y_pos < 0 - 50
		# 	@y_vel = -1 * @y_vel
		# 	@y_pos = -50
		# end	
		
		

		@x_vel *= 0.95
		@y_vel *= 0.95
		
	end

	def draw
		@image.draw(@x_pos, @y_pos, 3)
		@font.draw("Player #{@player}: #{@score}", @derp, 30, 5, 1, 1, 0xff_0000ff)
	end
end

