class VideoDecorator < Draper::Decorator
  delegate_all 

  def buy_or_watch_url
    if h.current_user.present?
      if h.current_user.owns?(object)
        h.video_url(object)
      else
        h.new_video_purchase_url(object)
      end
    else
      h.video_url(object)
    end
  end

  def thumbnail
    h.link_to h.image_tag(object.preview.url(:thumb)), buy_or_watch_url
  end
  
  def link
    h.link_to object.name, buy_or_watch_url
  end

  def edit_button
    if h.current_user.present? and h.current_user.admin?
      h.link_to 'Edit', h.edit_admin_video_url(object), class: 'btn btn-warning'
    end
  end

  def link_button
    if h.current_user.present? and h.current_user.owns?(object)
      thename = "Watch"
      theclass = "btn btn-success"
    else
      thename = "Buy"
      theclass = "btn btn-primary"
    end

    h.link_to thename, buy_or_watch_url, class: theclass
  end

  def revenue
    Money.new(object.purchases.sum(:amount_cents)).format
  end

  def publication
    object.publication_date.strftime("%B %-d, %Y")
  end
end
