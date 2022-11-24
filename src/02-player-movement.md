# Player Movement

In the last chapter, we got a dragon sprite showing up on the screen and some text. Let's build upon that by making it so we can control the dragon with our keyboard and a gamepad. Because guess what? That dragon is now the main character of this game we're building. 🐉 Buckle up, it's dragon riding time.

Simplify `mygame/app/main.rb` to be just this for now:

``` ruby
def tick args
  args.outputs.sprites << [120, 280, 100, 80, 'sprites/misc/dragon-0.png']
end
```

That displays our player dragon and nothing else. Excellent. Let's get this dragon moving!

In order to handle moving the player, we need to keep track of the position across the game loops. This lets us know where the player was last `tick`, check if they should move, and then update the position accordingly.

Update your `mygame/app/main.rb` to be this:

``` ruby
def tick args
  args.state.player_x ||= 120
  args.state.player_y ||= 280
  args.outputs.sprites << [args.state.player_x, args.state.player_y, 100, 80, 'sprites/misc/dragon-0.png']
end
```

There are a couple of new things here:

- `args.state`
- `||=`

Let's start with `args.state`. It's basically a blob that can be anything you want it to be, a bit like Kirby. Feed it `player_x` and it keeps track of it. Whatever you feed the `args.state`, it'll be accessible in future ticks. Keeping track of game state across ticks is important! It's part of the game loop. If we don't know where the player last was, how can we calculate where they should move to? We need to keep track of it in someplace. `args.state` is a fine place to start.

You can define anything on `args.state`, so it's up to you to use useful names. You could make `args.state.bleh` and set it to your favorite color, `args.state.bleh = "blue"` or your age, `args.state.age = 30`. Much like Kirby, `args.state` doesn't care what you feed it. It's just hungry for your data.

In this case, we're feeding it `||= 120`. What the heck is `||=`? Well... Maybe we need to start with `=`. You might read that as "equals" but it's actually the assignment operator. It means: set the thing on the left to the value on the right. It's a core programming concept. It's useful for assigning data to properties that we want to keep track of.

``` ruby
name = "Francis"
```

That code assigns the string Francis to the variable name. Then we can use `name` to refer to that value. It may not seem useful quite yet, but it will soon enough.

You could then use that variable like this:

``` ruby
puts name
```

That calls a the `puts` method and passes our argument `name` to it. It prints whatever the value is out to the console. If you put that in your game code and press <kbd>~<kbd> to open the console, you'll see it print `"Francis"` a bunch.

`||=` in English is "or equals". That code above, `args.state.player_x ||= 120` would be read as: assign the property `player_x` on `args.state` the numeric value of 120 unless it's alreay assigned a value.

Remember how tick is running once every 60 seconds? We don't want to always set `args.state.player_x` to `120`. We just want to set it to that initially and then we'll update that value when we press keys on our keyboard or buttons on our gamepad. We haven't done that yet, but that's what's next.

Wow! That was a lot of explaination for two measly lines of code. But I'm telling ya', they're two really important lines of code when it comes to game programming.

Them, finally, we change the `x` and `y` value for the dragon sprite to be the value stored in `args.state` so that we can actually make use of that value instead of our hard-coded position before.

## Checking for Input

In `tick` we'll check to see if a given input is pressed. If it is, we'll change the sprite's x and y position accordingly.

Our ole buddy `args` has a little something known as `args.inputs`. This lets us check... inputs! Isn't programming nice? Most of the time the words used in programming make sense. But some of the time, they really don't, and it's a gosh dang nightmare. But let's commit right here, right now to trying to name things in a way that's useful. Okay, you're committed. When you name a method `def thingy`, you'll remember this. And your ears will ring a little bit and your eyes will get just a little dry and you'll remember that you broke this commitment.
