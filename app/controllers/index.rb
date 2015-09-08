get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do 
  @user = User.find_or_create_by(username: params[:username])

  if @user.tweets_stale?
    @user.tweets.each {|tweet| tweet.destroy_all }
    @recent_tweets = @user.recent_tweets 
    erb :user_tweets
    end

    @recent_tweets = @user.tweets
    erb :user_tweets

end

get '/tweet/search' do 
  # @user = User.find_or_create_by(username: params[:username])
  # @recent_tweets = @user.recent_tweets 
    @user = params[:username]
   redirect to "/#{@user}"
end