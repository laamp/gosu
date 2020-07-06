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
  attr_reader :player, :game_objects

  def initialize
    super(Globals::SCREEN_WIDTH, Globals::SCREEN_HEIGHT)
    self.caption = Globals::GAME_NAME

    @player = Player.new
    @game_objects = []
    generate_floor
  end

  def update
    player.update

    game_objects.each do |obj|
      player.grounded if collision?(player, obj)
    end
  end

  def draw
    Gosu.draw_rect(0, 0, Globals::SCREEN_WIDTH, Globals::SCREEN_HEIGHT, Gosu::Color.new(255, 65, 0, 85))
    player.draw
    game_objects.each(&:draw)
  end

  def collision?(obj_a, obj_b)
    (obj_a.x < obj_b.x + obj_b.w) &&   # left edge <- right edge
      (obj_a.x + obj_a.w > obj_b.x) && # right edge -> left edge
      (obj_a.y < obj_b.y + obj_b.h) && # top edge <- bottom edge
      (obj_a.y + obj_a.h > obj_b.y)    # bottom edge -> top edge
  end

  def generate_floor
    x_position = 0

    while x_position < Globals::SCREEN_WIDTH
      obj = GameObject.new
      obj.place(x_position, Globals::SCREEN_HEIGHT - 64)
      game_objects << obj
      x_position += 32
    end
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
