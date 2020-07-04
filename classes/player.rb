# frozen_string_literal: true

# Human controlled player class
class Player
  def initialize
    @image = Gosu::Image.new('assets/sprites/confused-parrot.gif')
    @x = @y = @x_vel = @y_vel = 0.0
    @hp = 12
  end

  def warp(new_x_pos, new_y_pos)
    @x = new_x_pos
    @y = new_y_pos
  end

  def move_left
    @x_vel -= 2.0
  end

  def move_right
    @x_vel += 2.0
  end

  def move_up
    @y_vel -= 2.0
  end

  def move_down
    @y_vel += 2.0
  end

  def move
    @x += @x_vel
    @y += @y_vel

    @x_vel *= 0.7
    @y_vel *= 0.7
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
