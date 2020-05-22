class TweetsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @q = Tweet.ransack(params[:q])
    if user_signed_in?
      @followers = current_user.followings.pluck(:followed_id)
      @tweets = Tweet.tweets_for_me(@followers).order(:created_at).page params[:page]
      @tweet = Tweet.new
    else
      @tweets = Tweet.order(:created_at).page params[:page]
    end
  end

  def search_tweet
    @q = Tweet.ransack(params[:q])
    @tweet_search = @q.result(distinct: true)
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @likes = Like.where('tweet_id = ?', params[:id])
  end

  def edit
  end

  def create
    @tweets = Tweet.order(:created_at).page 1
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      flash[:notice] = 'Tu tweet ha sido creado. :)'
      redirect_to root_path
    else
      render :index
    end
  end

  def update
  end

  def destroy
  end

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @tweets = tag.tweets
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image_url)
  end
end
