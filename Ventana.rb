require 'gosu'
require './Jugador'
require './Bloque'
 
class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Juego Arkanoid"
    @player = Jugador.new(self)
    @bloque1 = Bloque.new(self, 20,100)
    @bloque2 = Bloque.new(self, 110,100)
    @bloque3 = Bloque.new(self, 200,100)
    @bloque4 = Bloque.new(self, 290,100)
    @bloques = [@bloque1, @bloque2, @bloque3, @bloque4]
  end

  def draw
    @player.draw
    @bloques.each { |bloque| bloque.draw }
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
    @player.collect_blocks(@bloques)
  end
end
