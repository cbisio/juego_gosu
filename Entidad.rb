class Entidad
    attr_accessor :x, :y
  
    def initialize x, y, sprite
      @x = x
      @y = y
      @sprite = sprite
    end
  
    def width
      @sprite.width
    end
  
    def height
      @sprite.height
    end
  
    def draw
      @sprite.draw x, y, 0
    end

    def collides? ball
        @auxx= ball.x < @x+width && ball.x+ball.width > @x
        @auxy= ball.y < @y+height && ball.y+ball.height > @y
        @aux = @auxx && @auxy

        if @aux && @auxx 
          ball.vy = -ball.vy
        elsif @aux && @auxy
          ball.vx = -ball.vx
        end
        
        return @aux
    end


  end