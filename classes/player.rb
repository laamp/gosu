# frozen_string_literal: true

# Human controlled player class
class Player
  attr_accessor :x, :y, :x_vel, :y_vel
  attr_reader :w, :h, :color

  def initialize
    @color = Gosu::Color.new(255, 175, 175, 0)
    @w = 64
    @h = 64
    @x = @y = @x_vel = @y_vel = 0.0

    self.x = (Globals::SCREEN_WIDTH / 2) - (w / 2)
    self.y = (Globals::SCREEN_HEIGHT / 2) - (h / 2)
  end

  def update
    moving_left if Gosu.button_down?(Gosu::KB_A)
    moving_right if Gosu.button_down?(Gosu::KB_D)
    moving_up if Gosu.button_down?(Gosu::KB_W)
    moving_down if Gosu.button_down?(Gosu::KB_S)

    move
  end

  def move
    self.x += x_vel
    self.y += y_vel

    self.x_vel *= 0.8
    self.y_vel *= 0.8
  end

  def draw
    Gosu.draw_rect(x, y, w, h, color)
  end

  def warp(new_x_pos, new_y_pos)
    self.x = new_x_pos
    self.y = new_y_pos
  end

  private

  def moving_left
    self.x_vel -= 2.0
  end

  def moving_right
    self.x_vel += 2.0
  end

  def moving_up
    self.y_vel -= 2.0
  end

  def moving_down
    self.y_vel += 2.0
  end
end
