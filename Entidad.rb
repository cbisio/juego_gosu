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


  end