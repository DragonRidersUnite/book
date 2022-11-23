# Player Movement

In the last chapter, we got a dragon sprite showing up on the screen and some text. Let's build upon that by making it so we can control the dragon with our keyboard and a gamepad. Because guess what? That dragon is now the main character of this game we're building. 🐉 Buckle up, it's dragon riding time.

Simplify `mygame/app/main.rb` to be just this for now:

``` ruby
def tick args
  args.outputs.sprites << [120, 280, 100, 80, 'sprites/misc/dragon-0.png']
end
```

That displays our player dragon and nothing else. Excellent. Let's get this dragon moving!

In `tick` we'll check to see if a given input is pressed. If it is, we'll change the sprite's x and y position accordingly.

Our ole buddy `args` has a little something known as `args.inputs`. This lets us check... inputs! Isn't programming nice? Most of the time the words used in programming make sense. But some of the time, they really don't, and it's a gosh dang nightmare. But let's commit right here, right now to trying to name things in a way that's useful. Okay, you're committed. When you name a method `def thingy`, you'll remember this. And your ears will ring a little bit and your eyes will get just a little dry and you'll remember that you broke this commitment.

In order to handle moving the player, we need to keep track of their position across the game loops. This lets us know where the player was last `tick`, check if they should move, and then update their position accordingly.

``` ruby
def tick args
  args.state.player_x ||= 120
  args.state.player_y ||= 280
  args.outputs.sprites << [args.state.player_x, args.state.player_y, 100, 80, 'sprites/misc/dragon-0.png']
end
```
