# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "x"
  config.consumer_secret     = "x"
  config.access_token        = "x"
  config.access_token_secret = "x"
end

#p client

# ligne qui permet de tweeter
#client.update('Mon premier tweet en ruby !!!! bah mon tout premier tweet tout court en fait')
#client.follow("SophieTochon")

#p client.user("seb_rombaut")

#client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
#  puts "#{tweet.user.screen_name}: #{tweet.text}"
#end

puts client.search("#ruby -rt", lang: "ja").first.text

