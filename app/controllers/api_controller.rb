class ApiController < ActionController::API
  def news
    @tweets = Tweet.limit(50).order(id: :desc)
    @tweets.map do |tweet|
      {
        id: tweet.id,
        content: tweet.content,
        user_id: tweet.user.id,
        likes_count: tweet.likes.count,
        retweet_count: tweet.retweets.count,
        retwitted_from: tweet.retweets.map{ |r| {user_email: r.user.email} }
      }
    end
    render json: @tweets
  end

  def date_tweet
    date_1 = Date.parse(params[:date_1])
    date_2 = Date.parse(params[:date_2])
    @tweets = Tweet.where(created_at: date_1..date_2)
    render json: @tweets
  end
  
  def create_tweet
  end
end