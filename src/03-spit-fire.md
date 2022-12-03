# Spit Fire

Our next mission is to make our dragon spit fire because that's just what they do. We'll piece this whole thing into a game with win and lose states, a narrative, and intentional design soon enough. But let's keep focusing on simple mechanics and the code for right now.

## Fire on Input

In the last chapter, we used `args.inputs` to check for player input from the four main directions. If those inputs were being pressed, then we moved the dragon. Now let's check to see if the <kbd>Z</kbd> key is pressed to know when to have our dragon spit a fire ball.

To check if a key was pressed, we can use `args.inputs.keyboard.key_down` and then whatever key we want to check. So in our case, we'll check `args.inputs.keyboard.key_down.z`. In our `#tick` method, right above where we render the dragon sprite, let's check for that input:

``` ruby
{{#include code/chapter_03/01_input/app/main.rb:36:40}}
```

Using `puts` is a really helpful way to check that our game works as we expect it to. In this case, every tick where the Z key is pressed down, it prints the string "Z key pressed" to the console (open it iwth <kbd>~</kbd>, remember?). Run your game and press the Z key a bunch and then open your console.

<img alt="screenshot of DragonRuby console showing Z key pressed 6 times" src="./img/c03-console-puts.png" style="max-width: 420px">

## Expanded Control Support

## Moving Fireballs

## Placeholder Square

## Tracking Fireballs

## Displaying a Sprite

## Cleaning Up
