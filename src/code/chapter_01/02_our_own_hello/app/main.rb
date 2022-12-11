def greet friend
  "Hello #{friend}!"
end

def tick args
  args.outputs.labels << [120, 120, greet("Dragon")]
  args.outputs.labels << [120, 100, greet("Oboe")]
  args.outputs.sprites << [120, 280, 100, 80, 'sprites/misc/dragon-0.png']
end
