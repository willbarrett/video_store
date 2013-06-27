module VideoHelper

  def video_buy_or_watch_url(video)
    if current_user.present?
      if current_user.owns?(video)
        video_url(video)
      else
        new_purchase_video_url(video)
      end
    else
      video_url(video)
    end
  end

  def video_thumbnail
    link_to image_tag(video.preview.thumbnail.url), video_buy_or_watch_url(video)
  end

  def video_link(video)
    link_to video.name, video_buy_or_watch_url(video)
  end

  def video_edit_link(video)
    if current_user.admin?
      link_to edit_admin_video_url(video)
    end
  end

  def video_button(video)
    if current_user.owns(video)
      theclass = "btn btn-success"
    else
      theclass = "btn btn-primary"
    end

    link_to video.name, video_buy_or_watch_url, class: theclass
  end


end
