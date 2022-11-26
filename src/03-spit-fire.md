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

We've once again changed the code without changing the behavior of the game. This iterative approach to game development and programming is _so_ important. It gives you permission to do something quickly to experiment and then take time to make things better. With this refactor, we've made the code easier to manage and reason about.

The `class Player` line defines what's known as a class. Many programming languages have classes, and they usually represnet nouns (things) that have properties and can take some actions. Classes have instances, which is one given case of it. You know how there are birds out there in the world? Bird is the concept of the animal--it's a classification (class). But if there was a bird sitting on your head, thats an instance of given bird. And the bird sitting on the powerline across the road watching your every move is another instance of a bird. If we wanted to represent birds in our game, we could define a class:

``` ruby
class Bird
  def evil?
    true
  end
end
```

That lets you create new birds with `Bird.new` and then check if they are evil (which they always are). For example:

``` ruby
bird1 = Bird.new
bird1.evil? # => true
bird2 = Bird.new
bird2.evil? # => true
```

You can have multiple instances of a class. But for our `Player` dragon, we'll just have one.

The `def initialize` line defines a method that's called whenever we create a new instance of `Player`. This is known as the constructor, and it's always called `initialize` in Ruby. Here you can set variables and write code that gets run once upon creation. The `@` in front of our variables makes them instance variables--variables that are available within the methods of a class instance (as the name implies). Setting these variables once and referencing them throughout the Player cleans up the code quite a bit.

The `tick` method that's newly defined does what our global `tick` method did before, but it contains only what's needed to be managed for the player. As we make our game more complex, encapsulating the code will make it easier to think about and change.

In the global `tick` method, we create a new player in the `args.state.player` if there isn't one already. And then every frame we update our player instance.

``` ruby
{{#include code/chapter_03-01_player_class.rb:44:47}}
```

We'll be introducing more classes soon enough, so it's great to have one established without actually changing the functionality of the game.

## Fire on Input

[ displaying a label ]

## Moving Fireballs

## Placeholder Square

## Tracking Fireballs

## Displaying a Sprite

## Cleaning Up
