require 'gosu'

class Bloque
    def initialize(window,x,y)
        @x = x
        @y = y
       @image = Gosu::Image.new(window, "cpeque.png", true)
     end

     def draw()
        @image.draw(@x, @y, 0)
      end
end