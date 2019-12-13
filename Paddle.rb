require './Entidad'

class Paddle < Entidad
    attr_accessor :up, :down, :score

    def initialize x, y, window
        @image = Gosu::Image.new(window, "paddle.png", true)
        
        super x, y, @image
        @score = 0
        
    end
    def draw()
        @image.draw(@x, @y, 0)
    end

    def collides? pelota
        pelota.x < x+width && pelota.x+pelota.width > x &&
        pelota.y < y+height && pelota.y+pelota.height > y
    end

    def update
        if @right
        @x -= 2.5
        end
        if @left
        @x += 2.5
        end
    end
end