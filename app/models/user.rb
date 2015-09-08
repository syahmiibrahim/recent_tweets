class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def recent_tweets
    @user_feed = $twitter.user_timeline(self.username)
    @recent_tweets = @user_feed.take(10)
    @recent_tweets.each do |tweet|
      Tweet.find_or_create_by(user_id: self.id, text: tweet.text)
    end
  end

  def tweets_stale?
    @user_time = self.tweets
      if (Time.now - @user_time.first.created_at)/60 > 15
        return true
      else
        return false
      end
  end
end
