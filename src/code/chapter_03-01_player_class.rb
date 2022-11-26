# TODO: test this works
class Player
  def initialize
    @x = 120
    @y = 280
    @speed = 12
    @w = 100
    @h = 80
  end

  def tick args
    if args.inputs.left
      @x -= @speed
    elsif args.inputs.right
      @x += @speed
    end

    if args.inputs.up
      @y += @speed
    elsif args.inputs.down
      @y -= @speed
    end

    if @x + @w > args.grid.w
      @x = args.grid.w - @w
    end

    if @x < 0
      @x = 0
    end

    if @y + @h > args.grid.h
      @y = args.grid.h - @h
    end

    if @y < 0
      @y = 0
    end

    args.outputs.sprites << [@x, @y, @w, @h, 'sprites/misc/dragon-0.png']
  end
end

def tick args
  args.state.player ||= Player.new
  args.state.player.tick args
end
