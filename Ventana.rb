require 'gosu'
require './Pelota'
require './Bloque'
require './Paddle'
 

class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Juego Arkanoid"
    crear_bloques
    @paddle = Paddle.new(330, 450, self)
    @pelota = Pelota.new(@paddle.x, @paddle.y, self)
    @font = Gosu::Font.new(20)
  end

  def crear_bloques

    @bloques = []
    4.times { |i| @bloques.push(Bloque.new(self, 165*i,100)) }

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
      @pelota.vx *= 1.1
      @pelota.vy *= 1.1
    end
    if @pelota.y > 640 and button_down? Gosu::KB_SPACE
      @pelota.reset @paddle.x, @paddle.y
    end

  end

end
