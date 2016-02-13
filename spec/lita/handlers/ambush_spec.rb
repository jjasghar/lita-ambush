require "spec_helper"
require 'yaml'

describe Lita::Handlers::Ambush, lita_handler: true do

  it { is_expected.to route_event(:unhandled_message).to(:response) }

  it "testing the storage into redis" do
    user1 = Lita::User.create(123, name: "user1")
    send_command("ambush user1: this is a taco!", as: user1)
    expect(replies.last).to eq("#{user1.name} I've stored the ambush")
    redis_rpop=Lita.redis.rpop("handlers:ambush:#{user1.name}")
    outputted_yaml=YAML.load(redis_rpop)
    expect(outputted_yaml[:time]).to be > 0
    expect(outputted_yaml[:msg]).to eq('this is a taco!')
  end

  it "should send store two messages" do
    user1 = Lita::User.create(123, name: "user1")
    send_command("ambush user1: this is a taco!", as: user1)
    send_command("ambush user1: this is a burruto!", as: user1)
    expect(replies.last).to eq("#{user1.name} I've stored the ambush")
    expect(replies.last).to eq("#{user1.name} I've stored the ambush")
    redis_rpop=Lita.redis.rpop("handlers:ambush:#{user1.name}")
    outputted_yaml=YAML.load(redis_rpop)
    expect(outputted_yaml[:msg]).to eq('this is a taco!')
    redis_rpop=Lita.redis.rpop("handlers:ambush:#{user1.name}")
    outputted_yaml=YAML.load(redis_rpop)
    expect(outputted_yaml[:msg]).to eq('this is a burruto!')
  end

  it "should respond with the message stored" do
    user1 = Lita::User.create(123, name: "user1")
    user2 = Lita::User.create(456, name: "user2")
    send_command("ambush #{user2.name}: this is a taco!", as: user1)
    send_message("I like to watch Sulvester Stalone!", as: user2)
    expect(replies.last).to eq("#{user2.name}: While you were out, #{user1.name} said: this is a taco!")
  end

  it "should do nothing with no messages" do
    user1 = Lita::User.create(123, name: "user1")
    user2 = Lita::User.create(456, name: "user2")
    send_message("I like to watch Sulvester Stalone!", as: user2)
    expect(replies.last).not_to eq("#{user2.name}: While you were out, #{user1.name} said: this is a taco!")
  end

  it "should respond with the multiple messages stored" do
    user1 = Lita::User.create(123, name: "user1")
    user2 = Lita::User.create(456, name: "user2")
    send_command("ambush #{user2.name}: this is a taco!", as: user1)
    send_command("ambush #{user2.name}: this is a burrito!", as: user1)
    send_message("I like to watch Sulvester Stalone!", as: user2)
    expect(replies[2]).to eq("#{user2.name}: While you were out, #{user1.name} said: this is a taco!")
    expect(replies[3]).to eq("#{user2.name}: While you were out, #{user1.name} said: this is a burrito!")
  end


end
