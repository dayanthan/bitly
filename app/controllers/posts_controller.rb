class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @short_url = Post.new(post_params)
    respond_to do |format|
      if @short_url.save
        format.js 
      else
        format.js
      end
    end
  end

  def shortened_url
    url = Post.find_by_short_url(params[:id])
    p (url.created_at < 10.days.before)
    url.update_attributes(:count=>url.count+1)
    # p time_ago_in_words(url.created_at)
    redirect_to url.base_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:base_url, :short_url, :count)
    end
end
