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
13:44 <j^2> j2bot: ambush dosman711: you smell like a ferret 
13:44 <j2bot> j^2 I've stored the ambush
13:44 <j^2> j2bot: ambush awaxa you also smell like a ferret 
13:44 <j2bot> j^2 I've stored the ambush
13:44 <dosman711> ferrets are cute
13:45 <j2bot> dosman711: While you were out, j^2 said: you smell like a ferret
13:45 <awaxa> i like ferrets too!
13:45 <j2bot> awaxa: While you were out, j^2 said: you also smell like a ferret
```

## License

[MIT](http://opensource.org/licenses/MIT)
