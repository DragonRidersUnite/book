module Main
  def tick args
    args.state.logo_rect ||= { x: 576,
                               y: 200,
                               w: 128,
                               h: 101 }

    args.outputs.labels  << { x: 640,
                              y: 600,
                              text: 'Hello World!',
                              size_px: 30,
                              anchor_x: 0.5,
                              anchor_y: 0.5 }

    args.outputs.labels  << { x: 640,
                              y: 510,
                              text: "Documentation is located under the ./docs directory. 150+ samples are located under the ./samples directory.",
                              size_px: 20,
                              anchor_x: 0.5,
                              anchor_y: 0.5 }

    args.outputs.labels  << { x: 640,
                              y: 480,
                              text: "You can also access these docs online at docs.dragonruby.org.",
                              size_px: 20,
                              anchor_x: 0.5,
                              anchor_y: 0.5 }

    args.outputs.labels  << { x: 640,
                              y: 400,
                              text: "The code that powers what you're seeing right now is located at ./mygame/app/main.rb.",
                              size_px: 20,
                              anchor_x: 0.5,
                              anchor_y: 0.5 }

    args.outputs.labels  << { x: 640,
                              y: 380,
                              text: "(you can change the code while the app is running and see the updates live)",
                              size_px: 20,
                              anchor_x: 0.5,
                              anchor_y: 0.5 }

    args.outputs.sprites << { x: args.state.logo_rect.x,
                              y: args.state.logo_rect.y,
                              w: args.state.logo_rect.w,
                              h: args.state.logo_rect.h,
                              path: 'dragonruby.png',
                              angle: Kernel.tick_count }

    args.outputs.labels  << { x: 640,
                              y: 180,
                              text: "(use arrow keys to move the logo around)",
                              size_px: 20,
                              anchor_x: 0.5,
                              anchor_y: 0.5 }

    args.outputs.labels  << { x: 640,
                              y: 80,
                              text: 'Join the Discord Server! https://discord.dragonruby.org',
                              size_px: 30,
                              anchor_x: 0.5 }

    if args.inputs.keyboard.left
      args.state.logo_rect.x -= 10
    elsif args.inputs.keyboard.right
      args.state.logo_rect.x += 10
    end

    if args.inputs.keyboard.down
      args.state.logo_rect.y -= 10
    elsif args.inputs.keyboard.up
      args.state.logo_rect.y += 10
    end

    if args.state.logo_rect.x > 1280
      args.state.logo_rect.x = 0
    elsif args.state.logo_rect.x < 0
      args.state.logo_rect.x = 1280
    end

    if args.state.logo_rect.y > 720
      args.state.logo_rect.y = 0
    elsif args.state.logo_rect.y < 0
      args.state.logo_rect.y = 720
    end
  end
end
