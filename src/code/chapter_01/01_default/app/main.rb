def tick args
  args.outputs.labels  << [640, 540, 'Hello World!', 5, 1]
  args.outputs.labels  << [640, 500, 'Docs located at ./docs/docs.html and 100+ samples located under ./samples', 5, 1]
  args.outputs.labels  << [640, 460, 'Join the Discord server! https://discord.dragonruby.org', 5, 1]

  args.outputs.sprites << { x: 576,
                            y: 280,
                            w: 128,
                            h: 101,
                            path: 'dragonruby.png',
                            angle: args.state.tick_count }

  args.outputs.labels  << { x: 640,
                            y: 60,
                            text: './mygame/app/main.rb',
                            size_enum: 5,
                            alignment_enum: 1 }
end
