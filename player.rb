require "gosu"

class
	def initialize(color, player)
		@color = color
		@width = 50
		@height = 50
		@acceleration = 1
		@x_vel = 0
		@y_vel = 0
		@y_pos = height/2
		if player == 1
			@x_pos = 400
		elsif player == 2
			@x_pos = 1520
		end
	end

	def up
		if @y_vel < 30
			@y_vel += @acceleration
		end
	end

	def down
		if @y_vel > -30
			@y_vel += @acceleration
		end
	end

	def right
		if @x_vel < 30
			@x_vel += @acceleration
		end
	end

	def left
		if @x_vel < -30
			@x_vel += @acceleration
		end
	end

	def move
		@x_pos += @x_vel
		@y_pos += @y_vel
		
	end
end

