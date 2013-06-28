require "spec_helper"

describe Purchase do
  describe :validations do
    it "should require a user and a video" do
      p = Purchase.new
      p.valid?.should be_false
      p.errors.messages[:user].should be_present
      p.errors.messages[:video].should be_present
    end

    it "should be passable" do
      lambda {
        FactoryGirl.create(:purchase)
      }.should change(Purchase, :count).by(1)
    end

  end

  describe "hooks" do
    it "should send email" do
      ActionMailer::Base.deliveries = []
      FactoryGirl.create(:purchase)
      ActionMailer::Base.deliveries.should_not be_empty
    end
  end
end
