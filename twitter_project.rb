# ligne très importante qui appelle la gem. Sans elle, le programme ne saura pas appeler Twitter
require 'twitter'
require 'pry'

# quelques lignes qui enregistrent les clés d'APIs
clientStreaming = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "x"
  config.consumer_secret     = "x"
  config.access_token        = "x"
  config.access_token_secret = "x"
end

clientRest = Twitter::REST::Client.new do |config|
  config.consumer_key        = "x"
  config.consumer_secret     = "x"
  config.access_token        = "x"
  config.access_token_secret = "x"
end

#warm-up
topics = ["coffee", "tea"]
clientStreaming.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end


#j'envoie un tweet à mes compagnons de groupe :)
poto = ["@SophieTochon", "@Twist_Help_Prog", "@Leilachh"]
poto.each do |person|
clientRest.update("#{person} vient à la piscine on est bien :)")
puts "#{person}"
end

#je spamme charles dacquay et the_hacking_pro
spammer = ["@charles_dacquay", "@the_hacking_pro"]
spammer.each do |person|
	clientRest.update("#{person} quand un spammer se fait spammer ;) https://gph.is/1jE2Wzg")
end

#je puts les 3 dernieres personnes qui ont tweeté Messi et le tweet
clientRest.search("to:imessi").take(3).collect do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
end


#journaliste de foot !
#je prends leurs 3 derniers tweet, je les affiche si ce sont du texte, je les like et enfin je follow le journaliste
journalistes = ["@PierreMenes", "@GuyCanal", "@vincentduluc", "@Nabil_djellit", "@carriere_eric"]
journalistes.each do |journaliste|
  journaliste = journaliste[1..100]
  #binding.pry
  clientRest.user_timeline(journaliste).take(3).collect do |tweet|
    #binding.pry
    if tweet.is_a? Twitter::Tweet 
      puts "#{tweet.text}" 
      clientRest.fav tweet
    end
  end
  clientRest.follow(journaliste)
end
