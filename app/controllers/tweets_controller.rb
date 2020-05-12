class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def show
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save!
      flash[:notice] = "Tu tweet ha sido creado. :)"
    else
      flash[:notice] = "Tu tweet no ha sido creado. :("
    end
    redirect_to "index"
  end

  def update
  end

  def destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :image_url)
  end
end
