# Spit Fire

Our next mission is to make our dragon spit fire because that's just what they do. We'll piece this whole thing into a game with win and lose states, a narrative, and intentional design soon enough. But let's keep focusing on simple mechanics and the code for right now.

## Fire on Input

In the last chapter, we used `args.inputs` to check for player input from the four main directions. If those inputs were being pressed, then we moved the dragon. Now let's check to see if the <kbd>Z</kbd> key is pressed to know when to have our dragon spit a fireball.

To check if a key was pressed, we can use `args.inputs.keyboard.key_down` and then whatever key we want to check. So in our case, we'll check `args.inputs.keyboard.key_down.z`. In our `#tick` method, right above where we render the dragon sprite, let's check for that input:

``` ruby
{{#include code/chapter_03/01_input/app/main.rb:36:40}}
```

Using `puts` is a really helpful way to check that our game works as we expect it to. In this case, every tick where the Z key is pressed down, it prints the string "Z key pressed" to the console (open it iwth <kbd>~</kbd>, remember?). Run your game and press the Z key a bunch and then open your console.

<img alt="screenshot of DragonRuby console showing Z key pressed 6 times" src="./img/c03-console-puts.jpg" style="max-width: 420px">

## Expanded Control Support

When making a game, it's important to support a variety of input configurations to make the game as accessible as possible. Sure, the keyboard arrow keys and the Z key are sensible defaults. But what if our player wants to use a gamepad controller? Or what if they would prefer to use WASD for movement? From the start of coding player input, let's support as many different inputs as reasonably possible.

In our case, we'll support three configurations:

- Arrow keys and Z
- WASD and J
- Gamepad

DragonRuby GTK is a big help in this department. Our code earily that checks `args.inputs.up` (down/left/right) already checks for the arrow keys, WASD, and gamepad input. Slick! We don't have to change anything there. But let's go ahead and update our logic check for firing the fireball to check all of the possible inputs.

``` ruby
{{#include code/chapter_03/02_input_expanded/app/main.rb:36:40}}
```

We learned about `||=` earlier, and that's a combination of two separate operators in Ruby. `||` represents "or" and `=` says to assign a value. If the value on the left doesn't have a value, assign it the value on the right. We can make use of the "or" (`||`) operator independently of the assignment operator (`=`) to control the logic within our game.

The code above says: if the z key is down OR the j key is down OR the A button on the gamepad is pressed, then output the string to the console.

You can combine `||` on one line (`if monday || tuesday || wednesday`), but it can be helpful to break long lines to make our code easier to read.

Outputting info to the console isn't that helpful for the player, but can you begin to imagine how we'll use that check to instead display a fireball.

## Displaying Fireballs

We want to display a fireball on the screen when the action key is pressed. We've got most of the code, all we need to do is change `puts` to instead display the fireball.

At the top of `#tick` (`#whatever` is Ruby shorthand for "the whatever method"), assign an empty array to `args.state.fireballs` if nothing has been assigned yet. This will let us keep track of fireballs across the game loop to do all sorts of things with them (display them, move them, collide them with other objects):

``` ruby
{{#include code/chapter_03/03_displaying_fireballs/app/main.rb:1:4}}
```

Then where we check for the action input, push a fireball into the `arg.state.fireballs` array based on the current player's x and y position:

``` ruby
{{#include code/chapter_03/03_displaying_fireballs/app/main.rb:38:45}}
```

Then all we have to do is render our fireballs by pushing them into the `args.outputs.labels` collection. DragonRuby is smart enough to know that if we push an array into any `args.outputs` collection it'll flatten it and display them correctly. Thanks, DragonRuby!

Play your game and see what happens! Fireballs everywhere. Wait! You're not impressed by those fireballs? I'd be pretty frightened if the word fireball was flying at me.

![screenshot of the game showing the word 'fireball' throughout with the dragon flying around](./img/c03-fireball-display.jpg)

Wait, where are you going? Why are you muttering "I didn't sign up to read no stinkin' book where you output the word fireball on the screen, I'm here for the real flame, the good stuff..."

## Moving Fireballs

Guess what? We're sticking with ole "fireball" for now! It's silly and fun and I haven't found a good fireball sprite to use. We'll get there, we'll get there. But let's first make the fireballs move across the screen.

When we moved our player dragon, we took the x and y position and added or substracted values in each `#tick` based upon if any directional input was pressed. Our fireballs will move regardless of any button pressed once they're extruded from our ole dragon's mouth. Because our game is simple and the dragon only faces to the right, all of the fireballs will move to the right. How do we go about that on our X-Y axis? We just increase the `x` position of the fireball each tick. Let's do that and see what happens:

``` ruby
{{#include code/chapter_03/04_moving_fireballs/app/main.rb:38:48}}
```

Right between where we add a new fireball to `args.state.fireballs` and we display them using `args.outputs.labels`, our new code does this:

1. Loop through the array of `args.state.fireballs`
2. For each fireball, update the array value at the `0` index, which is the x position of the fireball, to be the dragon's speed plus 2 (because we want the fireball to move faster than the dragon).

Move your dragon around, spit some fire, and bask in the glory of a word moving so smoothly across the screen that it almost looks like a... fireball!

There's a lot of important concepts in those three newly added lines of code. In Ruby, when there's an array of data, we can loop through **each** item and modify their properties. Games are composed of huge collections of things: enemies, fireballs, menu options, player inventory. Arrays (and just collections in general) aren't anything to be afraid of, and soon enough, you'll be thinking about your games in them.

Looping through an array of data in each `#tick` and then doing _something_ is the stuff games are made of! Here are some ways this can be applied in all sorts of games: enemy behavior, checking for collision, animating. As our game (and any game you make) gets more complex, looping through collections of data becomes more and more common.

[TODO: illustration of game loop and then a little loop inside where we loop through collections]

## Switching to Hashes

## Displaying a Sprite

## Cleaning Up

[when they go off screen]
