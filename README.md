# lita-ambush

[![Build Status](https://travis-ci.org/jjasghar/lita-ambush.svg?branch=master)](https://travis-ci.org/jjasghar/lita-ambush)[![Coverage Status](https://coveralls.io/repos/jjasghar/lita-ambush/badge.svg?branch=master)](https://coveralls.io/r/jjasghar/lita-ambush?branch=master)

**lita-ambush** is a handler for [Lita](http://lita.io/) that stores messages for a user and displays
them the next time they say something.

We also recorded the three of us making this plugin. You can watch it [here](http://youtu.be/mQ6ULfjewE0).

## Supported Chat systems

- IRC
- [Hipchat](http://i.imgur.com/6ekGWNG.png)

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

## License

[MIT](http://opensource.org/licenses/MIT)
