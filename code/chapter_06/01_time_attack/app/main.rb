def spawn_target(args)
  size = 64
  {
    x: rand(args.grid.w * 0.4) + args.grid.w * 0.6,
    y: rand(args.grid.h - size * 2) + size,
    w: size,
    h: size,
    path: 'sprites/target.png',
  }
end

def tick args
  args.state.player ||= {
    x: 120,
    y: 280,
    w: 100,
    h: 80,
    speed: 12,
    path: 'sprites/misc/dragon-0.png',
  }
  args.state.fireballs ||= []
  args.state.targets ||= [
    spawn_target(args), spawn_target(args), spawn_target(args)
  ]
  args.state.score ||= 0
  args.state.timer ||= 30 * 60

  args.state.timer -= 1

  if args.state.timer < 0
    labels = []
    labels << {
      x: 40,
      y: args.grid.h - 40,
      text: "Game Over!",
      size_enum: 10,
    }
    labels << {
      x: 40,
      y: args.grid.h - 90,
      text: "Score: #{args.state.score}",
      size_enum: 4,
    }
    labels << {
      x: 40,
      y: args.grid.h - 132,
      text: "Fire to restart",
      size_enum: 2,
    }
    args.outputs.labels << labels

    if args.inputs.keyboard.key_down.z ||
        args.inputs.keyboard.key_down.j ||
        args.inputs.controller_one.key_down.a
      $gtk.reset
    end

    return
  end

  if args.inputs.left
    args.state.player.x -= args.state.player.speed
  elsif args.inputs.right
    args.state.player.x += args.state.player.speed
  end

  if args.inputs.up
    args.state.player.y += args.state.player.speed
  elsif args.inputs.down
    args.state.player.y -= args.state.player.speed
  end

  if args.state.player.x +  args.state.player.w > args.grid.w
    args.state.player.x = args.grid.w - args.state.player.w
  end

  if args.state.player.x < 0
    args.state.player.x = 0
  end

  if args.state.player.y + args.state.player.h > args.grid.h
    args.state.player.y = args.grid.h - args.state.player.h
  end

  if args.state.player.y < 0
    args.state.player.y = 0
  end

  if args.inputs.keyboard.key_down.z ||
      args.inputs.keyboard.key_down.j ||
      args.inputs.controller_one.key_down.a
    args.state.fireballs << {
      x: args.state.player.x + args.state.player.w - 12,
      y: args.state.player.y + 10,
      w: 32,
      h: 32,
      path: 'sprites/fireball.png',
    }
  end

  args.state.fireballs.each do |fireball|
    fireball.x += args.state.player.speed + 2

    if fireball.x > args.grid.w
      fireball.dead = true
      next
    end

    args.state.targets.each do |target|
      if args.geometry.intersect_rect?(target, fireball)
        fireball.dead = true
        target.dead = true
        args.state.score += 1
        args.state.targets << spawn_target(args)
      end
    end
  end

  args.state.targets.reject! { |t| t.dead }
  args.state.fireballs.reject! { |f| f.dead }

  args.outputs.sprites << [args.state.player, args.state.fireballs, args.state.targets]

  labels = []
  labels << {
    x: 40,
    y: args.grid.h - 40,
    text: "Score: #{args.state.score}",
    size_enum: 4,
  }
  labels << {
    x: args.grid.w - 40,
    y: args.grid.h - 40,
    text: "Time Left: #{(args.state.timer / 60).round}",
    size_enum: 2,
    alignment_enum: 2,
  }
  args.outputs.labels << labels
end

$gtk.reset
