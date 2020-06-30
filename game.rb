# frozen_string_literal: true

require 'gosu'

require_relative 'classes/player'

# entry point for the game
class Game < Gosu::Window
  def initialize
    super 1024, 768
    self.caption = 'Gosuvania'

    @background_image = Gosu::Image.new('assets/sprites/placeholder.png', tileable: true)

    @player = Player.new
    @player.center
  end

  def update; end

  def draw
    @background_image.draw(0, 0, 0)
    @player.draw
  end
end

Game.new.show
