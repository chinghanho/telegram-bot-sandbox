require 'telegram/bot'
require "json"
require 'yaml'

file = open(File.expand_path('../sentences.json', __FILE__))
json = file.read
sentences = JSON.parse(json)

token = ""

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    puts message.to_yaml
    bot.api.send_message(chat_id: message.chat.id, text: sentences.sample)
  end
end
