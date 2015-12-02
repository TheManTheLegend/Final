require "gosu"

class Puck
	def initialize
		@size = 30
		@height = 1080
		@width = 1920
		@x_pos = 960 - 25
		@y_pos = 540 - 30
		@x_vel = 0
		@y_vel = 0
		@x_prop = 0
		@y_prop = 0
		

		@image = Gosu::Image.new("puck.png")
		
	end

	def colliding(x, y)
		if (@x_pos - x).abs < 75 && (@y_pos - y).abs < 75

		end
	end

	def move
		@x_pos += @x_vel
		@y_pos += @y_vel

		if @x_pos > @width - 50
			@x_vel = -@x_vel - 20
		
		elsif @x_pos < 0 - 50
			@x_vel = -@x_vel + 20
		end

		if @y_pos > @height - 50
			@y_vel = -@y_vel - 20

		elsif @y_pos < 0 - 50
			@y_vel = -@y_vel + 20
		end

		@x_vel *= 0.97
		@y_vel *= 0.97
	end
	def proportion(x, y)
		relative_x = @x_pos - x + 50
		relative_y = @y_pos - y + 50
		difference = (relative_x).abs + (relative_y).abs
	  @x_prop = (@x_pos - x) / difference
	  @y_prop = (@y_pos - y) / difference
	end

	def draw
		@image.draw(@x_pos, @y_pos, 3)
	end
	def pulse(x, y)
		if (@x_pos - x).abs < 75 || (@y_pos - y).abs < 75
			proportion(x, y)

			@x_vel = 40 * @x_prop
			@y_vel = 40 * @y_prop
		end
	end


end