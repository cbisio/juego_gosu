require 'gosu'

class Bloque

    attr_reader :x, :y

    def initialize(window,x,y)
      @x = x
      @y = y
      @image = Gosu::Image.new(window, "brick.png", true)
    end


    def draw()
      @image.draw(@x, @y, 0)
    end
end