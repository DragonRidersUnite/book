def greet friend
  "Hello #{friend}!"
end

def tick args
  args.outputs.labels  << { x: 120, y: 120, text: greet("Dragon") }
  args.outputs.labels  << { x: 120, y: 100, text: greet("Oboe") }
  args.outputs.sprites << { x: 120, y: 280, w: 100, h: 80, path: 'sprites/misc/dragon-0.png' }
end
