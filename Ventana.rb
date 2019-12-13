require 'gosu'
require './Jugador'
require './Bloque'
 
class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Mi primer juego"
    @player = Jugador.new(self)
    @bloque1 = Bloque.new(self, 100,20)
    @bloque2 = Bloque.new(self, 100,200)
    @bloque3 = Bloque.new(self, 100,110)
    @bloque4 = Bloque.new(self, 100,290)
  end

  def draw
    @player.draw
    @bloque1.draw
    @bloque2.draw
    @bloque3.draw
    @bloque4.draw
  end
 
  def update
    if button_down? Gosu::KbRight
      @player.move_right
    elsif button_down? Gosu::KbLeft
      @player.move_left
    elsif button_down? Gosu::KbUp
      @player.move_up
    elsif button_down? Gosu::KbDown
      @player.move_down
    end
  end
end
