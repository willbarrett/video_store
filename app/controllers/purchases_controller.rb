class PurchasesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_video

  def new
    @purchase = Purchase.new
    @purchase.video = @video
  end

  def create
    Stripe.api_key = 'MLqyzl8wv0Yxq26bQ82Baqi7fEaif3GY'

    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        amount: @video.price_cents,
        currency: "usd",
        card: token,
        description: current_user.email
      )
      @purchase = Purchase.new(params[:purchase])
      @purchase.amount_cents = @video.price_cents
      @purchase.user = current_user
      @purchase.video = @video
      if @purchase.save
        redirect_to video_url(@video), notice: 'Thank you for your purchase!'
      else
        render action: "new"
      end
    rescue
      flash.now[:error] = "There was a problem charging your card."
      render action: "new"
    end
  end

  protected

  def find_video
    @video = Video.find_by_slug!(params[:video_id])
  end
end
