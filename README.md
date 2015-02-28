# lita-ambush


**lita-ambush** is a handler for [Lita](http://lita.io/) that stores messages for a user and displays
them the next time they say something.

## Installation

Add lita-ambush to your Lita instance's Gemfile:

```ruby
gem "lita-ambush"
```

## Configuration

### Optional attributes

Still TODO
* `preview_join_messages` (Symbol) - Post a message for the user when they
just join the room. Options are `:on`, and `:off`. Default: `:off`.

### Example

Still TODO
```
Lita.configure do |config|
  config.handlers.ambush.preview_join_messages = :off
end
```

## Usage

```
user1> lita ambush user2: Ohai! You forgot your card at lunch!
Lita> Ambush Prepared
User2 joined the channel
Lita> User2 you have 1 message(s) waiting (Still TODO)
user2> That was a great lunch!
Lita> user2: while you were out, user1 said: Ohai! You forgot your card at lunch!
```

## License

[MIT](http://opensource.org/licenses/MIT)
