# Ruby Primer

New to Ruby? Here's a brief walk through of the common language features and syntax as a quick reference.

## Core Types

When working with Ruby, we've got some core data types to work with.

Strings, numbers, arrays, hashes, and booleans.

``` ruby
greeting = "Hello, my name is Francis the Dragon."
age = 583
favorite_foods = ["apples", "cookies"]
address = {
  line1: "123 Sky Way",
  line2: "Apt 2",
  state: "New Dragon",
  zip: "12345",
}
hungry = true
```

## String Interpolation

Insert a value into a string using `#{}`:

``` ruby
"My favorite foods are: #{favorite_foods.join}"
```

## Print to the Console

This will write to stdout and the DragonRuby console:

``` ruby
puts "anything"
```

## Loops

If you have an array, a hash, or any object that collects data, you can loop through their values with `#each`.

``` ruby
favorite_foods.each do |food|
  puts(food)
end

address.each do |key, value|
  puts("#{key}: #{value}")
end
```

## Conditionals

``` ruby
if monday? || tuesday?
  puts "not fun days"
elsif wednesday? || thursday?
  puts "fine day"
else
  puts "great days"
end
```

`&&` - AND

`||` - OR

## Methods & Return Values

Define a method:

``` ruby
def add(num1, num2)
  num1 + num2
end
```

Ruby implicitly returns the last expression in method and by default returns `nil` if there's no expression.

You can explicitly return a value with `return`:

``` ruby
def add(num1, num2)
  return num1 + num2
end
```

Explicit returns are mostly used when you want to exit a method early.

## Blocks

Blocks are chunks of Ruby code that yield to the caller. At first you'll use blocks when calling specific methods, like `#each`, but it can be useful to write your own blocks as well.

[📺 Ruby Blocks Explained](https://www.youtube.com/watch?v=1YjSP-cEzMo)

## nil

`nil` in Ruby is known as `null` in other languages. It's the absence of a value.

## Exceptions

When something goes wrong in Ruby, an exception is thrown. You can rescue from exceptions using the `rescue` keyword:

``` ruby
begin
  # do_some_things
rescue SomeError => e
  puts e
end
```

## Resources

- [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
- [Ruby is for Fun](https://rubyisforfun.com/)
