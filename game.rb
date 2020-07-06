# frozen_string_literal: true

$LOAD_PATH.concat(
  [
    File.join(File.dirname(__FILE__), 'modules'),
    File.join(File.dirname(__FILE__), 'classes')
  ]
)

%w[gosu globals game_object player].each(&method(:require))

# entry point for the game
class Game < Gosu::Window
  attr_reader :player

  def initialize
    super(Globals::SCREEN_WIDTH, Globals::SCREEN_HEIGHT)
    self.caption = Globals::GAME_NAME

    @player = Player.new
    @object = GameObject.new
    @object.place(200, 800)
  end

  def update
    player.update

    p 'collision?' if player.x < @object.x
  end

  def draw
    Gosu.draw_rect(0, 0, Globals::SCREEN_WIDTH, Globals::SCREEN_HEIGHT, Gosu::Color.new(255, 65, 0, 85))
    player.draw
    @object.draw
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Game.new.show
