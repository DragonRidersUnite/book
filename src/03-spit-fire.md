# Spit Fire

Our next mission is to make our dragon spit fire because that's just what they do. We'll piece this whole thing into a game with a narrative and intentional design soon enough. But let's keep focusing on simple mechanics and code for right now.

## Player Refactor

In the code from the last chapter, there's a lot of code related to the player, from handling their input to moving them, to displaying the sprite. See how we have so much state with the `player_` prefix? That's a sign we can probably refactor the code to make it a bit easier to manage.

``` ruby
{{#include code/chapter_02_movement_and_boundaries.rb}}
```

Let's change our `app/main.rb` to now be this instead:

``` ruby
{{#include code/chapter_03-01_player_class.rb}}
```
