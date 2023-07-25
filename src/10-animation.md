# Animation

While the polish we've implemented in our game is making it feel a lot better to play, it's still a bit lifeless. There's a key piece missing that we haven't covered yet. It's animation! Whether it's Sonic tapping his foot when he hasn't moved in a while or his feet moving as he runs, animating our sprites gives our game personality. It makes the game feel alive.

Have you ever made a flip animation in the bottom corner of a notebook? You make a different drawing on each page corner and then flip through the pages quickly to see it move. That concept of drawing the frames and each frame subtly changing what's drawn to convey motion is core to 2D animation, whether it's a game, an animated GIF, or a classic Disney film.

## Animating Our Dragon

In the `mygame/sprites/misc/` folder, there are more dragon images than just `dragon-0.png`. There are 5 additional frames of the dragon flapping its wings. Perfect! That's just what we need.

The core of how this will work is that each dragon frame will be displayed for some period of time and then we'll switch to the next frame after that time has passed.


``` ruby
{{#include code/chapter_10/01_animating/app/main.rb:117:126}}
```

Where we lazily set `args.state.player`, we no longer specify the `path` to the sprite. We'll set that as part of animating the player right below.

`#frame_index` is a method DragonRuby GTK gives us on integers to keep track of what frame to use when animating. `0` is when we want to start the animation, which we want to start at the beginning of our game. We have 6 frames in our animation, and we want to display each of them for 8 ticks, repeating forever! Change the `hold_for` value and see how it affects the animation speed and feel of the game. Pick a rate that feels good for you or just stick with 8.

Then we take the `player_sprite_index` and use that when specifying the `path` of our player sprite by interpolating it into the path to our sprite. Our dragon frames are named `dragon-0.png`, `dragon-1.png`, and so on. So we take what `#frame_index` gives us and inject it into the path to the image, making that value dynamic. Remember string interpolation from Chapter 1? It comes into play all the time when coding.

## A Note on Spritesheets

If you've done any game development before, you may be familiar with spritesheets, where each frame of an animation is contained within one image file. When using a spritesheet for animation, instead of changing which image file path is used for the sprite to render, you change which piece of the large spritesheet you render. [The DragonRuby GTK docs have a detailed example of how to do this.](http://docs.dragonruby.org/#----animation-using-sprite-sheet---main-rb)

## Extra Credit

- How would you increase the animation speed when the dragon is moving to simulate faster flapping of their wings?
- Animate the fireball with another frame of animation to make it feel alive
- Animate the targets in some way

## Summary

When making a game, it's likely that anything that moves will animate, even if it's just a little. It's a valuable concept to understand and implement on your own. Compare the game now to when we started—it's come quite a long way from an immovable sprite with some text!

## What's Next

We're nearly finished with our game! All that's left is to add a title screen and then publish the game online so others can play it.
