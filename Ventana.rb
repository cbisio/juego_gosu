require 'gosu'
require './Pelota'
require './Bloque'
require './Paddle'
 

class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Juego Arkanoid"
    @bloque1 = Bloque.new(self, 20,100)
    @bloque2 = Bloque.new(self, 110,100)
    @bloque3 = Bloque.new(self, 200,100)
    @bloque4 = Bloque.new(self, 290,100)
    @bloques = [@bloque1, @bloque2, @bloque3, @bloque4]
    @paddle = Paddle.new(330, 450, self)
    @pelota = Pelota.new(@paddle.x, @paddle.y, self)
    @font = Gosu::Font.new(20)
  end

  def draw
    @pelota.draw
    @bloques.each { |bloque| bloque.draw }
    @paddle.draw
    
  end

  def update
    @pelota.update
    @pelota.collect_blocks(@bloques)
    @paddle.update

    if button_down? Gosu::KbRight and @paddle.x+@paddle.width<640
      @paddle.move_right()
    elsif button_down? Gosu::KbLeft and @paddle.x>0
      @paddle.move_left()
    end

    if @paddle.collides?(@pelota)
      @pelota.vy = -@pelota.vy
      @pelota.vx *= 1.1
      @pelota.vy *= 1.1
    end
    if @pelota.y > 640 and button_down? Gosu::KB_SPACE
      @pelota.reset @paddle.x, @paddle.y
    end

  end

end
