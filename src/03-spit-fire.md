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

## Moving Fireballs

## Switching to Hashes

## Displaying a Sprite

## Cleaning Up

[when they go off screen]
