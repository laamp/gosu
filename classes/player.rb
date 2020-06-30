# frozen_string_literal: true

# Human controlled player class
class Player
  def initialize
    @image = Gosu::Image.new('assets/sprites/confused-parrot.gif')
    @x = @y = @x_vel = @y_vel = 0.0
    @hp = 12
  end

  def center
    @x = 512
    @y = 384
  end

  def move_left
    @x_vel -= 1.0
  end

  def move_right
    @x_vel += 1.0
  end

  def move
    @x += @x_vel

    @x_vel *= 0.9
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
