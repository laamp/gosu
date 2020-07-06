# frozen_string_literal: true

# Generic object with collision
class GameObject
  attr_accessor :x, :y
  attr_reader :w, :h, :color

  def initialize
    @color = Gosu::Color.new(255, 255, 255, 255)
    @w = 32
    @h = 32
    @x = @y = 0
  end

  def draw
    Gosu.draw_rect(x, y, w, h, color)
  end

  def place(new_x_pos, new_y_pos)
    self.x = new_x_pos
    self.y = new_y_pos
  end
end
