require 'gosu'
require './Entidad'

class Pelota < Entidad
  attr_accessor :vx, :vy

  def initialize x, y, window
    @window = window
    @image = Gosu::Image.new(window, "ball.png", true)
    super x, y-25, @image
    @vx = @vy = -2
  end

  def reset x, y
    @x = x
    @y = y-25
    @vx = @vy = -2
  end

  def update
    @x += @vx
    @y += @vy

    if @x < 0 || @x > @window.width-width
      @vx = -@vx
    end

    if @y < 0 
      @vy = -@vy
    end
  end

  def collect_blocks(bloques)
    bloques.reject! { |bloque| bloque.collides? (self) }
  end
end