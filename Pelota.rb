require 'gosu'
require './Entidad'

class Pelota < Entidad
  attr_accessor :vx, :vy

  def initialize window
    @window = window
    @image = Gosu::Image.new(window, "ball.png", true)
    super 300, 300, @image
    reset
  end

  def reset
    @x = @window.width/2-width/2
    @y = @window.height/2-height/2
    @vx = @vy = 2
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