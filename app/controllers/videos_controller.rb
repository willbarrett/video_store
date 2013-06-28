class VideosController < ApplicationController

  before_filter :find_video, only: :show
  before_filter :ensure_ownership, only: :show

  def index
    @videos = Video.all
  end

  def show
  end

  protected 

  def find_video
    @video = Video.find_by_slug!(params[:id])
  end

  def ensure_ownership
    if current_user.present?
      unless current_user.owns?(@video)
        redirect_to new_video_purchase_url(@video)
      end
    else
      session[:next_url] = video_url(params[:id])
      flash[:notice] = "Please log in or sign up to continue."
      redirect_to new_session_url
    end
  end
end
