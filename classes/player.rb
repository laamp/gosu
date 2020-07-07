# frozen_string_literal: true

# Human controlled player class
class Player
  attr_accessor :x, :y, :x_vel, :y_vel, :on_ground, :can_jump
  attr_reader :w, :h, :color

  def initialize
    @color = Gosu::Color.new(255, 175, 175, 0)
    @w = 64
    @h = 64
    @x = @y = @x_vel = @y_vel = 0.0
    @on_ground = @can_jump = false

    warp((Globals::SCREEN_WIDTH / 2) - (w / 2), 0)
  end

  def update
    apply_gravity unless on_ground
    self.can_jump = on_ground

    moving_left if Gosu.button_down?(Gosu::KB_A)
    moving_right if Gosu.button_down?(Gosu::KB_D)
    moving_up if Gosu.button_down?(Gosu::KB_W)
    moving_down if Gosu.button_down?(Gosu::KB_S)
    jump if Gosu.button_down?(Gosu::KB_SPACE)

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

  def grounded
    self.on_ground = true
    self.y_vel = 0
  end

  private

  def apply_gravity
    self.y_vel += 1.16
    self.y_vel *= 1.25
  end

  def jump
    self.on_ground = false
    self.y_vel = -28 if can_jump
  end

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
