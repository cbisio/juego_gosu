require './Entidad'

class Paddle < Entidad
    attr_accessor :right, :left, :score

    def initialize x, y, window
        @image = Gosu::Image.new(window, "paddle.png", true)
        
        super x, y, @image
        @score = 0
        
    end
    def draw()
        @image.draw(@x, @y, 0)
    end

    def move_right()
        @x += 5
    end

    def move_left()
        @x -= 5
    end

end