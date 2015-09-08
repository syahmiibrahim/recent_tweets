class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def recent_tweets
    @user_feed = $twitter.user_timeline(self.username)
    @recent_tweets = @user_feed.take(10)
    @recent_tweets.each do |tweet|
     @tweets = Tweet.find_or_create_by(user_id: self.id, text: tweet.text)
        self.tweets << @tweets
    end
  end

  def tweets_stale?
    @user_tweets = self.tweets 
      if (Time.now - @user_tweets.first.created_at)/60 >= 15
        return true
      else
        return false
      end

  end
end
