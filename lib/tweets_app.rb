class TweetsApp

  def call
    puts 'Welcome to Twitter'

    while true
      puts 'Enter a username:'
      username = gets.chomp

      puts 'Enter a message:'
      message = gets.chomp

      tweet = Tweet.new({'username' => username, 'message' => message})
      tweet.save

      tweets = Tweet.all
      render(tweets)
    end

  end

  private

  def render(tweets)
    puts "\n"

    tweets.each.with_index(1) do |tweet, i|
      puts "#{i}. #{tweet.username} says: #{tweet.message}"
    end

    puts "\n"
  end
end
