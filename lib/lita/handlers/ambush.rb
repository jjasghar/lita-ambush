require 'time'
require 'yaml'

module Lita
  module Handlers
    class Ambush < Handler

      route(/^ambush\s+(\S+):?\s*(.+)/, :ambush, command: true, help: { "ambush USER: message" => "Ambushes the USER with the message you leave."} )
      route(/./, :response)

      def ambush(request)
        ambushee = request.matches[0][0]
        ambushee = ambushee[1..-1] if ambushee.start_with? "@"
        require 'pry'; binding.pry
        store_hash = {
          time: ::Time.now.to_i,
          msg: request.matches[0][1],
          ambusher: request.user.name
        }.to_yaml
        log.debug(ambushee)
        redis.lpush(ambushee,store_hash)
        request.reply_with_mention("I've stored the ambush")
      end

      def response(request)
        unless request.message.body.start_with? "ambush"
          stored_yaml = redis.rpop(request.user.mention_name)
          while not stored_yaml.nil? do
            outputted_yaml=YAML.load(stored_yaml)
            request.reply_with_mention("While you were out, #{outputted_yaml[:ambusher]} said: #{outputted_yaml[:msg]}")
            stored_yaml = redis.rpop(request.user.mention_name)
          end
        end
      end

    end

    Lita.register_handler(Ambush)
  end
end
