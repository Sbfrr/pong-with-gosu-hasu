class Paddle
  WIDTH = 20
  HEIGTH = 96
  SPEED = 8

  attr_reader :side, :y

  def initialize(side)
    @side = side
    @y = Pong::HEIGTH/2
  end

  def x1
    case side
    when :left
      0
    when :right
      Pong::WIDTH - WIDTH
    end
  end

  def x2
    x1 + WIDTH
  end

  def y1
    y + HEIGTH/2
  end

  def y2
    y - HEIGTH/2
  end

  def draw(window)
    color = Gosu::Color::WHITE

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color,
    )
  end

  def up!
    @y -= SPEED
    @y = 0 + HEIGTH/2 if y2 <= 0
  end

  def down!
    @y += SPEED
    @y = Pong::HEIGTH-HEIGTH/2 if y1 > Pong::HEIGTH
  end

end