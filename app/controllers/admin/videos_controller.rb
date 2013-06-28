class Admin::VideosController < Admin::BaseController

  before_filter :find_video, only: [:edit, :update]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    if @video.save
      redirect_to admin_root_url, notice: 'Video Created'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @video.update_attributes(params[:video])
      redirect_to admin_root_url, notice: 'Video Updated'
    else
      render action: 'edit'
    end
  end

  protected
  
  def find_video
    @video = Video.find_by_slug!(params[:id])
  end

end
