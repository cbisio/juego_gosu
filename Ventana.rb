require 'gosu'
 
class Ventana < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Mi primer juego"
  end
end
