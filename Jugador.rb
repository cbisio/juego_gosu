require 'gosu'

class Jugador
    def initialize(window)
        @x = 300
        @y = 200
       @image = Gosu::Image.new(window, "cpeque.png", true)
     end
     def draw()
       @image.draw(@x, @y, 0)
     end
     def move_right()
       @x = @x + 1
     end
     def move_left()
       @x = @x - 1
     end
     def move_up()
        @y = @y - 1
      end
      def move_down()
        @y = @y + 1
      end
  end