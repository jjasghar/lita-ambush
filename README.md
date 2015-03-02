# lita-ambush

[![Build Status](https://travis-ci.org/jjasghar/lita-ambush.svg?branch=master)](https://travis-ci.org/jjasghar/lita-ambush)[![Coverage Status](https://coveralls.io/repos/jjasghar/lita-ambush/badge.svg?branch=master)](https://coveralls.io/r/jjasghar/lita-ambush?branch=master)

**lita-ambush** is a handler for [Lita](http://lita.io/) that stores messages for a user and displays
them the next time they say something.

We also recorded the three of us making this plugin. You can watch it [here](http://youtu.be/mQ6ULfjewE0).

## Installation

Add lita-ambush to your Lita instance's Gemfile:

```ruby
gem "lita-ambush"
```

## Configuration

### Optional attributes

None

## Usage

```
user1> lita ambush user2: Ohai! You forgot your card at lunch!
Lita> Ambush Prepared
user2> That was a great lunch!
Lita> user2: while you were out, user1 said: Ohai! You forgot your card at lunch!
```

## TODO

- Have the plugin tell the time elapsed since the ambush was created, example:
`user2: while you were out, user1 said: Ohai! You forgot your card at lunch! was sent 10 minutes ago`

- Have the plugin report the number of waiting messages you have when a `JOIN` action happens, example:

```
User2 joined the channel
Lita> User2 you have 1 message(s) waiting
```

Configuration can happen via:

* `preview_join_messages` (Symbol) - Post a message for the user when they
just join the room. Options are `:on`, and `:off`. Default: `:off`.

```
Lita.configure do |config|
  config.handlers.ambush.preview_join_messages = :off
end
```

## License

[MIT](http://opensource.org/licenses/MIT)
