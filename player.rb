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
		if player == 1
			@x_pos = 400
		elsif player == 2
			@x_pos = 1520
		end
		
	
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
		if @y_pos > @height/2 - 100 && @x_pos 
			@y_vel = -1 * @y_vel
			@y_pos = @height - 50
		end		
		if @y_pos < 0 - 50
			@y_vel = -1 * @y_vel
			@y_pos = -50
		end	

		#right goal limits
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
		
		

		@x_vel *= 0.95
		@y_vel *= 0.95
		
	end

	def draw
		@image.draw(@x_pos, @y_pos, 3)
	end
end

