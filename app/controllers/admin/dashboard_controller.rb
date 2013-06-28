class Admin::DashboardController < Admin::BaseController
  def show
    @videos = Video.all
  end
end
