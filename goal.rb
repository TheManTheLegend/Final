require "gosu"



class Goal
	def initialize (x, rot)
		@x = x
		@width = 1920
		@height = 1080
		@y = @height/2

		@w = 100
		@h = 200
		@image = Gosu::Image.new("goal.png")
		@rot = rot
	end

	def draw
		@image.draw_rot(@x, @y, 4, @rot)
	end



end