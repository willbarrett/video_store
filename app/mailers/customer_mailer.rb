class CustomerMailer < ActionMailer::Base

  def purchase_notification(purchase)
    @purchase = purchase
    to = purchase.user.email
    from = "video_store@example.com"
    subject = "Thank you for purchasing a video!"
    mail(to: to, from: from, subject: subject)
  end
end
