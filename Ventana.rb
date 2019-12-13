require 'gosu'
require './Pelota'
require './Bloque'
require './Paddle'

module ZOrder
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

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
    @font.draw_text("Score: #{@pelota.score}", 10, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def update
    @pelota.update
    @pelota.collect_blocks(@bloques)


    if button_down? Gosu::KbRight and @paddle.x+@paddle.width<640
      @paddle.move_right()
    elsif button_down? Gosu::KbLeft and @paddle.x>0
      @paddle.move_left()
    end

    if @paddle.collides?(@pelota)
      @pelota.vx *= 1.1
      @pelota.vy *= 1.1
      if @bloques.length == 0
        crear_bloques
        @pelota.vx *= 1.25
        @pelota.vy *= 1.25
      end
    end
    if @pelota.y > 640 and button_down? Gosu::KB_SPACE
      @pelota.reset @paddle.x, @paddle.y
    end

  end

end
