require 'gosu'
require './Pelota'
require './Bloque'
 
class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Juego Arkanoid"
    @player = Pelota.new(self)
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
    @player.update
    @player.collect_blocks(@bloques)
  end
end
