require 'gosu'
require './Pelota'
require './Bloque'
require './Paddle'
 
class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Juego Arkanoid"
    @pelota = Pelota.new(self)
    @bloque1 = Bloque.new(self, 20,100)
    @bloque2 = Bloque.new(self, 110,100)
    @bloque3 = Bloque.new(self, 200,100)
    @bloque4 = Bloque.new(self, 290,100)
    @bloques = [@bloque1, @bloque2, @bloque3, @bloque4]
    @paddle = Paddle.new(330, 450,self)
  end

  def draw
    @player.draw
    @bloques.each { |bloque| bloque.draw }
    @paddle.draw
  end
 
  def update
    @pelota.update
    @pelota.collect_blocks(@bloques)

    if @paddle.collides?(@pelota)
      @pelota.vy = -@pelota.vy
      @pelota.vx *= 1.1
      @pelota.vy *= 1.1
    end

  end

  def button_right id
    case id
    when Gosu::KbQ
      @paddle.right = true
    when Gosu::KbA
      @paddle.left = true
    end
  end

  def button_left id
    case id
    when Gosu::KbQ
      @paddle.right = false
    when Gosu::KbA
      @paddle.left = false
    end
  end
end
