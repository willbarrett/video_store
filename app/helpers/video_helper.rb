module VideoHelper

  def video_buy_or_watch_url(video)
    if current_user.present?
      if current_user.admin? or current_user.owns?(video)
        video_url(video)
      else
        new_video_purchase_url(video)
      end
    else
      video_url(video)
    end
  end

  def video_thumbnail(video)
    link_to image_tag(video.preview.url(:thumb)), video_buy_or_watch_url(video)
  end

  def video_link(video)
    link_to video.name, video_buy_or_watch_url(video)
  end

  def video_edit_link(video)
    if current_user.admin?
      link_to 'Edit', edit_admin_video_url(video), class: 'btn btn-warning'
    end
  end

  def video_button(video)
    if current_user.admin? or current_user.owns?(video)
      thename = "Watch"
      theclass = "btn btn-success"
    else
      thename = "Buy"
      theclass = "btn btn-primary"
    end

    link_to thename, video_buy_or_watch_url(video), class: theclass
  end


end
