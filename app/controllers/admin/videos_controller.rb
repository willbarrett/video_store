class Admin::VideosController < Admin::BaseController
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


end
