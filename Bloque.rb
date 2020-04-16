require 'gosu'
require './Entidad'

class Bloque < Entidad

    attr_reader :x, :y

    def initialize(window,x,y)
      @image = Gosu::Image.new(window, "brick.png", true)
      super x, y, @image
    end


    def draw()
      @image.draw(@x, @y, 0)
    end
end