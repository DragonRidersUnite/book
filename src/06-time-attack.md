# Time Attack

We've _almost_ got a game. But we need some way for the game to end. A lot of game loops end with the player's character dying, where they respawn or start over again. Other game loops end when the player reaches the end of a level.

For our simple game, let's add a 30 second timer that counts down. The objective of our game will be to see how many targets can the player hit in that time window. Let's call our game **Target Practice**. Every dragon needs some practice before they head out into battle, right?

Adding a timer to our game introduces a few new concepts we'll build out in this chapter:

1. Keeping track of time and displaying it
2. Stopping our game when the timer runs out
3. Displaying a Game Over screen with the score
4. Allowing the player to restart the game and play again

## Getting It Working

We'll start by introducing `args.state.timer` that will be used to keep track of how much time remains.

``` ruby
{{#include code/chapter_06/01_time_attack/app/main.rb:25:28}}
```

We lazily set it to `30 * 60`. We want the game to last thirty seconds and our `#tick` method runs sixty times every second, so we multiple them together to get the total number of ticks our timer will run for. We'll then subtract one from `args.state.timer` every `#tick` so that it decreases as we play our game.

Right below decreasing our `args.state.timer` by one, we check to see if the timer is less than zero. If it is, that means game over.

``` ruby
{{#include code/chapter_06/01_time_attack/app/main.rb:28:59}}
```
If it is game over, then we let the player know, display their final score, and tell them how to play again (by pressing the fire button). We make an array of labels which we then push into `args.outputs.labels` to efficiently render them all.

If any of our fire keys are pressed, the game is reset with `$gtk.reset` and the player can play again.

The `return` line is _really_ important. It says, return out of the `#tick` method so that none of the code below runs. We don't want to have the dragon be moveable or for targets to spawn when it's game over. So we eject early and only display the game over screen details.

![game over screen showing a score of 11 with text saying 'Fire to restart'](./img/c06-game-over.jpg)

Way at the bottom of `#tick`, let's display a label with the time remaining:

``` ruby
{{#include code/chapter_06/01_time_attack/app/main.rb:121:135}}
```

We use the same pattern of creating a `labels` array, pushing in the player's score and the time remaining. In order to get the time remaining, we divide it by 60 and round. We do the opposite of what we did when we set the total time in ticks.

The `alignment_enum` let's us specify that we want the text to be right aligned instead of the default left alignment. This let's us nicely position our timer in the upper right corner of the game.

![gameplay with Time Left reading 10 seconds](./img/c06-timer.jpg)

[section summary]

## Restart Grace Period

## Refactor

- fire input
- game over method
- FPS constant
