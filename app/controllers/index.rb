get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do 
  @user = User.find_or_create_by(username: params[:username])

  if @user.tweets_stale?
    @user.tweets.destroy_all
    @user.recent_tweets 
    end

    @recent_tweets = @user.recent_tweets
  erb :user_tweets

end

get '/tweet/search' do 
  # @user = User.find_or_create_by(username: params[:username])
  # @recent_tweets = @user.recent_tweets 
    @user = params[:username]
   redirect to "/#{@user}"
end