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
    if (url.created_at < 30.days.before)
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    else
        if Rails.env.production?
          ip = request.remote_ip
        else
          ip =  Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
        end
      location = Geocoder.search(ip).first.country
      TrackUrl.create(:post_id=> url.id, :ip_address=>ip,:location=>location)
      url.update_attributes(:count=>url.count+1)
      redirect_to url.base_url
    end
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
