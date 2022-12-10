# Animation

While the polish we've implemented in our game is making it feel a lot better to play, it feels a bit lifeless. There's a key piece missing that we haven't covered yet. It's animation! Whether it's Sonic tapping his foot when he hasn't moved in a while or his feet moving as he runs, animating our sprites gives our game personality. It makes the game feel alive.

Have you ever made a flip animation in the bottom corner of a notebook? You draw each frame and then flip through the pages quickly to see it animate. That concept of drawing the frames and each frame subtly changing what's drawn to convey motion is core to 2D animation, whether it's a game, an animated GIF, or a classic Disney film.

In this chapter we'll make our dragon flap its wings because it's flying through the air.

## Animating Our Dragon

In `mygame/sprites/misc/` there are more dragon images than just `dragon-0.png`. There are 5 additional frames of the dragon flapping their wings. Perfect! That's just what we need.

The core of how this will work is that each dragon frame will be displayed for some period of time and then we'll switch to the next frame after that time has passed.


``` ruby
{{#include code/chapter_10/01_animating/app/main.rb:117:126}}
```

Where we lazily set `args.state.player`, we no longer specify the `path` to the sprite. We'll set that as part of animating the player right below.

`#frame_index` is a method DragonRuby GTK gives us on integers to keep track of what frame to use when animating. `0` is when we want to start the animation, which we want to start at the beginning. We have 6 frames total, and we want to display each of them for 8 ticks, repeating forever! Change the `hold_for` value and see how it affects the animation speed and feel of the game. Pick a rate that feels good for you or just stick with 8.

Then we take the `player_sprite_index` and use that when specifying the `path` of our player sprite by interpolating it into the path to our sprite. Our dragon sprites are named `dragon-0.png`, `dragon-1.png`, and so on. So we take what `#frame_index` gives us and inject it into the path to the image to make that value dynamic.

In Ruby, when you have a string that uses double quotes, `"hi there"`, you can inject Ruby code inside of it using `#{}`. This is really useful. For example: `"2 + 2 = #{2 + 2}"`, that evaluates the mathematical expression and converts the answer (`4`) to a string and displays it.

## A Note on Spritesheets

## Extra Credit

- How would you increase the animation speed when the dragon is moving to simulate faster flapping of their wings?

## What's Next
