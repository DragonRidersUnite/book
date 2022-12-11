# Sound

One of the quickest ways to make any game you're building go from feeling flat to having some oomph is to add sound. Whenever any button is pressed, play a sound effect. Play music in the background. If your game has multiple moods, change the music based on the level or part of your game.

For _Target Practice_, we'll have three unique sound effects:

1. When the fireball is spit by the dragon
2. When the fireball hits a target
3. When the game ends

We'll also add in a music track that plays in the background.

Download the following files and put them in the `mygame/sounds/` folder:

- [fireball.wav](./code/chapter_08/01_sound/sounds/fireball.wav)
- [target.wav](./code/chapter_08/01_sound/sounds/target.wav)
- [game-over.wav](./code/chapter_08/01_sound/sounds/game-over.wav)
- [flight.ogg](./code/chapter_08/01_sound/sounds/flight.ogg)

A note on audio file formats: in DragonRuby, sound effects are generally WAV (`.wav`) files. WAV files are uncompressed, meaning they can be quite large in size, but are high-quality. Because sound effects are so short, the file size is less of a concern. Music files are OGG (`.ogg`), an open-source format for audio that works across all of the platforms you game can run on. OGG files are compressed, thus smaller in size than WAV files, making them good for music tracks.

## Playing Sounds in DragonRuby Game Toolkit

DragonRuby GTK gives us a really simple way to play a sound in our game. You push a string of the path of the sound into `args.outputs.sounds` and it plays once:

``` ruby
args.outputs.sounds << "sounds/fireball.wav"
```

Easy enough!

Playing music is a little more complex, but still pretty simple. You set a value on the `args.audio` hash that lets you manage the audio track across the game loop. You can check the current progress, whether or not it's paused, and more. That looks like:

``` ruby
if args.state.tick_count == 1
  args.audio[:music] = { input: "sounds/flight.ogg", looping: true }
end
```

That says when we're on the first tick, play the `flight.ogg` music track on repeat. We only want to run that code once because we don't want to start it over and over each `#tick`. The `:music` key can be any value we want. If you have multiple music tracks in your game, you can use a different key to manage the various tracks.

## Add Music & Sound Effects To Our Game

Let's add the sound effects and music track to the game.

Let's kick things off by starting the music track on the first tick at the top of `#tick`:

``` ruby
{{#include code/chapter_08/01_sound/app/main.rb:102:105}}
```

If you've got the files in the right place and start your game, you'll hear the music play.


Above our check for whether or not the game is over, when the timer is 0, let's play `game-over.ogg` and pause the music:

``` ruby
{{#include code/chapter_08/01_sound/app/main.rb:122:132}}
```

Right above when we add a new fireball to `args.state.fireballs`, play `fireball.wav`:

``` ruby
{{#include code/chapter_08/01_sound/app/main.rb:136:145}}
```

And, finally, when a fireball hits a target, let's play `target.wav`:

``` ruby
{{#include code/chapter_08/01_sound/app/main.rb:155:164}}
```

Now we've got music and sound effects in our game. Isn't it wild how the game feels more fun and polished?

## Make Your Own Music & Sound Effects

I use [jsfxr](https://sfxr.me/) to create sound effects for games. It's simple and free with a lot of settings to tweak. You can quickly download a WAV file that you can drop into your game. Try making your own sound effects and replacing the ones I've provided. You often won't know if a sound effect sounds _right_ until you drop it in your game. So experiment and see what works best.

As for making your own music, there are lots of options out there. I use [1BitDragon](https://1bitdragon.com/), a limited (in a good way) tool for making music. [LMMS](https://lmms.io/) is a free, well-loved tool. Garageband on MacOS would get you pretty far too!

There are many ways to convert the sounds you make to various formats, from command-line tools like ffmpeg to desktop apps. [Convertio](https://convertio.co/) is a free online service, among many, that you can use as well.

Making music and sound effects for games is a huge topic that's beyond the scope of this book, but hopefully these tools can help you get started.

If you do change the sounds in your game, you'll need to restart it to get DragonRuby GTK to refresh them.

## Extra Credit

- Replace the provided sound effects with ones you made
- Make your own music and drop it in
- It can be a little bit annoying to hear the music over and over while you're making your game, so how would you make it so you can mute the music while working on it? [This resource can help you out.](https://www.dragonriders.community/recipes/music)

## What's Next

In the next chapter we'll continue to polish our game to prepare it for release by making the background blue and displaying clouds that float by.
