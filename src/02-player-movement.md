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

That calls a the `puts` method and passes our argument `name` to it. It prints whatever the value is out to the console. If you put that in your game code and press <kbd>~</kbd> to open the console, you'll see it print `"Francis"` a bunch.

`||=` in English is "or equals". That code above, `args.state.player_x ||= 120` would be read as: assign the property `player_x` on `args.state` the numeric value of 120 unless it's already assigned a value.

Remember how tick is running once every 60 seconds? We don't want to always set `args.state.player_x` to `120`. We just want to set it to that initially and then we'll update that value when we press keys on our keyboard or buttons on our gamepad. We haven't done that yet, but that's what's next.

Wow! That was a lot of explanation for two measly lines of code. But I'm telling ya', they're two really important lines of code when it comes to game programming.

Then, finally, we change the `x` and `y` value for the dragon sprite to be the value stored in `args.state` so that we can actually make use of that value instead of our hard-coded position before.

## Checking for Input

In `tick` we'll check to see if a given input is pressed. If it is, we'll change the sprite's x and y position accordingly.

Our ole buddy `args` has a little something known as `args.inputs`. This lets us check... inputs! Isn't programming nice? Most of the time the words used in programming make sense. But some of the time, they really don't, and it's a gosh dang nightmare. But let's commit right here, right now to trying to name things in a way that's useful. Okay, you're committed. When you name a method `def thingy`, you'll remember this. And your ears will ring a little bit and your eyes will get just a little dry and you'll remember that you broke this commitment.

Let's make use of `args.inputs`:

``` ruby
def tick args
  args.state.player_x ||= 120
  args.state.player_y ||= 280

  if args.inputs.left
    args.state.player_x -= 10
  elsif args.inputs.right
    args.state.player_x += 10
  end

  if args.inputs.up
    args.state.player_y += 10
  elsif args.inputs.down
    args.state.player_y -= 10
  end

  args.outputs.sprites << [args.state.player_x, args.state.player_y, 100, 80, 'sprites/misc/dragon-0.png']
end
```

You can now control the dragon with WASD, the arrow keys, or your controller. Pretty neat! It's almost fun. All it took was 10 lines of code. Let's break them down.

``` ruby
if args.inputs.left
  args.state.player_x -= 10
elsif args.inputs.right
  args.state.player_x += 10
end
```

This section checks for horizontal movement. If the left input is pressed, reduce the player's x position by 10 pixels. `-=` means, subtract the value on the right from the value on the left. It's the same as `args.state.player_x = args.state.player_x - 10`, but it's much more concise. We increase `player_x` to move right, decrease it to move left.

`if` and `elsif` are conditional checks. The code only runs if the value is true (more specifically, truthy, but let's not worry about that yet).

``` ruby
if args.inputs.up
  args.state.player_y += 10
elsif args.inputs.down
  args.state.player_y -= 10
end
```
Then we check for vertical movement. We add to `player_y` to move up, decrease it to move down.

What if we wanted our dragon to move faster though? We could change those four instances of `10` to be `12` and see how that feels, sure. But that's annoying to update it all over. Let's make use of a variable! We'll call it `speed`:

``` ruby
def tick args
  args.state.player_x ||= 120
  args.state.player_y ||= 280
  speed = 10

  if args.inputs.left
    args.state.player_x -= speed
  elsif args.inputs.right
    args.state.player_x += speed
  end

  if args.inputs.up
    args.state.player_y += speed
  elsif args.inputs.down
    args.state.player_y -= speed
  end

  args.outputs.sprites << [args.state.player_x, args.state.player_y, 100, 80, 'sprites/misc/dragon-0.png']
end
```

Whoa! We just refactored that code. It's easier to change (ETC) now, which is a sign we're improving things.

## Boundaries

You can move your dragon completely off the screen, lost in the great unknown! This isn't ideal. Let's make it so our little buddy can't leave the bounds of the screen.

``` ruby
{{#include code/chapter_02/app/main.rb}}
```

Our dragon won't leave the screen. Woot woot! We've got some serious code here! Look at that logic. Here's what changed:

We moved the width and height of the player into variables so that they're easier to reference and reuse. Boom. We need those to do some math on the boundaries too. There's a general programming idea out there known as Don't Repeat Yourself (DRY). As soon as you have a piece of code, especially a number, that represents a value and is used multiple times, put it in a variable. This makes its intent clear as to what it represents and makes it easier to change. Win-win.

Here's the good stuff. We check the boundary for the x axis:

``` ruby
{{#include code/chapter_02/app/main.rb:20:26}}
```

We check the right side of the screen: if the current player's x position plus their width is greater than `args.grid.w`, then we set the x position to the width of the screen (`args.grid.w`) minus the width of the sprite. For example, if we move the sprite so it has the x position of 1284, 4 pixels past the right edge of the screen, we override that change and set it to 1280 minus the player's width.

It's so important that this happens after checking for input. You don't want to change `args.state.player_x` after this check, otherwise the boundary won't be enforced. Order matters with the code we write within `tick`.

`args.grid.w` is the width of the screen. It's always 1280, but we don't want to have that magic number in our code. So we use `args.grid.w`.

Next we check the left side of the screen: if the player's x is less than 0, then we set it to zero. That's a bit similar to the right side, just simpler.

Then we do the same thing for the top and bottom of the screen by checking the y position.

## Extra Credit

- When you move the dragon horizontally and vertically at the same time, the dragon moves twice as fast. How could you make it so the dragon moves at a uniform speed still when that happens?
- Ruby has an in-built method which ensures that a numeric value is between some bounds, find it and replace our bounds checking code with it.

## What's Next

In the next chapter we'll make our dragon spit fireballs when we press a key or button. Watch out!
