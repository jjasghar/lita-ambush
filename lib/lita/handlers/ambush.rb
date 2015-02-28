require 'yaml'

module Lita
  module Handlers
    class Ambush < Handler

      route(/^ambush:\s+(\S+):\s(.+)/, :ambush, command: true)
      route(/./, :response)

      def ambush(request)
        store_hash = {
          time: Time.now.to_i,
          msg: request.matches[0][1],
          ambusher: request.user.name
        }.to_yaml
        redis.lpush(request.matches[0][0],store_hash)
        request.reply("#{request.user.name} I've stored the ambush")
      end

      def response(request)
        unless request.message.body.start_with? "ambush"
          stored_yaml = redis.rpop(request.user.name)
          while not stored_yaml.nil? do
            outputted_yaml=YAML.load(stored_yaml)
            request.reply("#{request.user.name}: While you were out, #{outputted_yaml[:ambusher]} said: #{outputted_yaml[:msg]}")
            stored_yaml = redis.rpop(request.user.name)
          end
        end
      end

    end

    Lita.register_handler(Ambush)
  end
end
